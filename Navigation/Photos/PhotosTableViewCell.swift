

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func buttonTap()
}

class PhotosTableViewCell: UITableViewCell {
    weak var delegate: PhotosTableViewCellDelegate?

    var photos = [String]()

    private let photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(PhotosCollectionViewCellForTableView.self, forCellWithReuseIdentifier: PhotosCollectionViewCellForTableView.identifier)
        return collection
    }()

    private lazy var headLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        return label
    }()

    private lazy var goToGalleryButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.tintColor = .black
        button.addTarget(self, action: #selector(goToGallery), for: .touchUpInside)
        return button
    }()
    @objc private func goToGallery() {
        delegate?.buttonTap()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
    photoCollection.delegate = self
    photoCollection.dataSource = self
    let inset: CGFloat = 12

        [photoCollection, headLabel, goToGalleryButton].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            //label
            headLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            headLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            //button
            goToGalleryButton.centerYAnchor.constraint(equalTo: headLabel.centerYAnchor),
            goToGalleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            //photoCollection
            photoCollection.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: inset),
            photoCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset - 8),
            photoCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset + 8),
            photoCollection.heightAnchor.constraint(equalToConstant: 100),
            photoCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}


// MARK: - UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCellForTableView.identifier, for: indexPath) as! PhotosCollectionViewCellForTableView
        cell.update(photos[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.bounds.width - sideInset * 3) / 4
        return CGSize(width: height, height: height)
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
    }
}
