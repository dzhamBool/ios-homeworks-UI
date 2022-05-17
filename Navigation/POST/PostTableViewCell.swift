
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
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [whiteView, postImageView, postAuthorLabel, descriptionLabel].forEach { contentView.addSubview($0) }

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
            descriptionLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset)
        ])
    }
}
