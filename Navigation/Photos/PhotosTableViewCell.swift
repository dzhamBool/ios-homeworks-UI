

import UIKit

protocol PhotosTableViewCellProtocol: AnyObject {
    func delegateButtonAction(cell: PhotosTableViewCell)
}

class PhotosTableViewCell: UITableViewCell {
    weak var delegate: PhotosTableViewCellProtocol?

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)

        return stackView
    }()

    private lazy var headLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
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

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8

        return layout
    }()

    private lazy var photoCollectionView: UICollectionView = {

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        stackView.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)

        return collectionView
    }()

    @objc private func goToGallery() {
        delegate?.delegateButtonAction(cell: self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.backgroundColor = .systemGray6
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.headLabel)
        self.stackView.addArrangedSubview(self.goToGalleryButton)
        self.backView.addSubview(photoCollectionView)

        NSLayoutConstraint.activate([
            // backView
            self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            // stackView
            self.stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12),
            self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12),
            self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12),
            // goToGalleryButton
            self.goToGalleryButton.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 1),
            // photoCollectionView
            self.photoCollectionView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            self.photoCollectionView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12),
            self.photoCollectionView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12),
            self.photoCollectionView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor),
            self.photoCollectionView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.25)
        ])
    }
}
// MARK: - UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return photosList.count
        return 4
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

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.bounds.width - sideInset * 5) / 4
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
