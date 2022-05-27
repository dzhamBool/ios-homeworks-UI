
import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        return layout
    }()
    
    private lazy var photoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Photo Gallery"
    }
    
    private func setupCollectionView() {
        self.view.addSubview(self.photoCollectionView)
        
        NSLayoutConstraint.activate([
            self.photoCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.photoCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.photoCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.photoCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        
        let photo = photosList[indexPath.row]
        let postModel = PhotosCollectionViewCell.PhotoGalery(image: photo.image)
        cell.setup(with: postModel)
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.item)
        let animatedPhotoViewController = AnimatedPhotoViewController()
        let photo = photosList[indexPath.row]
        let viewModel = AnimatedPhotoViewController.ViewModel(image: photo.image)
        animatedPhotoViewController.setup(with: viewModel)
        self.view.addSubview(animatedPhotoViewController.view)
        self.addChild(animatedPhotoViewController)
        animatedPhotoViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animatedPhotoViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animatedPhotoViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animatedPhotoViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            animatedPhotoViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        animatedPhotoViewController.didMove(toParent: self)
    }
}
