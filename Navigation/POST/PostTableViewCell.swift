
import UIKit

class PostTableViewCell: UITableViewCell {

    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let postImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .magenta // отключить
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    private let postAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        label.numberOfLines = 0
        return label
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()

    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(_ post: PostModel) {
        postImageView.image = UIImage(named: post.image)
        postAuthorLabel.text = post.author
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }

    private func layout() {
        [whiteView, postImageView, postAuthorLabel, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }

        let viewInset: CGFloat = 8
        let inset: CGFloat = 10

        NSLayoutConstraint.activate([
            // whiteView
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            // postImageView
            postImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            postImageView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset),
            postImageView.widthAnchor.constraint(equalToConstant: 80),
            // postAuthorLabel
            postAuthorLabel.topAnchor.constraint(equalTo: postImageView.topAnchor),
            postAuthorLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: inset),
            postAuthorLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            // descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: postAuthorLabel.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: postAuthorLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: postAuthorLabel.trailingAnchor),
            // likesLabel
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            likesLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset),
// viewsLabel
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            viewsLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset)
        ])
    }
}
