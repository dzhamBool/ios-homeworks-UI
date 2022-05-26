
import UIKit


protocol PostTableViewCellProtocol: AnyObject {
    func tapPostImageViewGestureRecognizerDelegate(cell: PostTableViewCell)
    func tapLikesLabelGestureRecognizerDelegate(cell: PostTableViewCell)
}

class PostTableViewCell: UITableViewCell {

    weak var delegate: PostTableViewCellProtocol?

    private var tapLikesLabelGestureRecognizer = UITapGestureRecognizer() // НАЖАТИЕ LIKETITLE
    private var tapPostImageViewGestureRecognizer = UITapGestureRecognizer() // НАЖАТИЕ IMAGE



    private let postImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .black
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let postAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        // label.isUserInteractionEnabled = true
        return label
    }()
    //    func setupGesture() {
    //    let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(addLike))
    //        likesLabel.addGestureRecognizer(tapGuesture)
    //    }

    @objc private func addLike() {
        

    }

    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.postAuthorLabel.text = nil
        self.postImageView.image = nil
        self.descriptionLabel.text = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }

    func setupCell(_ post: PostModel) {
        postAuthorLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: " + String(post.likes)
        viewsLabel.text = "Views: " + String(post.views)
    }

    private func setupGesture() {
            self.tapLikesLabelGestureRecognizer.addTarget(self, action: #selector(self.likesLabelHandleGesture(_:)))
            self.likesLabel.addGestureRecognizer(self.tapLikesLabelGestureRecognizer)
            self.likesLabel.isUserInteractionEnabled = true

            self.tapPostImageViewGestureRecognizer.addTarget(self, action: #selector(self.postImageViewHandleGesture(_:)))
            self.postImageView.addGestureRecognizer(self.tapPostImageViewGestureRecognizer)
            self.postImageView.isUserInteractionEnabled = true
        }

    @objc func likesLabelHandleGesture(_ gestureRecognizer: UITapGestureRecognizer) {
            guard self.tapLikesLabelGestureRecognizer === gestureRecognizer else { return }
            delegate?.tapLikesLabelGestureRecognizerDelegate(cell: self)
        }

        @objc func postImageViewHandleGesture(_ gestureRecognizer: UITapGestureRecognizer) {
            guard self.tapPostImageViewGestureRecognizer === gestureRecognizer else { return }
            delegate?.tapPostImageViewGestureRecognizerDelegate(cell: self)

        }


    private func layout() {
        [postAuthorLabel, postImageView, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            //author
            postAuthorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            postAuthorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            postAuthorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: inset),
            //image
            postImageView.topAnchor.constraint(equalTo: postAuthorLabel.bottomAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            //description
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            // likesLabel
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            likesLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            // viewsLabel
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}
