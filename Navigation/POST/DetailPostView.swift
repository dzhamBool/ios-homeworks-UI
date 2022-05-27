
import UIKit

class DetailPostView: UIView {
    
    struct PostModel: PostViewProtocol {
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
    }
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .black.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var postAuthorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var likeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.text = "Likes: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.textColor = .black
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var viewLabel: UILabel = {
        let label = UILabel()
        label.text  = "Views: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemGray5
        button.imageView?.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        button.addTarget(self, action: #selector(tapToClose), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(self.mainView)
        self.addSubview(self.closeButton)
        self.mainView.addSubview(self.backView)
        self.backView.addSubview(self.postAuthorLabel)
        self.backView.addSubview(self.postImageView)
        self.backView.addSubview(self.descriptionLabel)
        self.backView.addSubview(self.likeStackView)
        self.likeStackView.addArrangedSubview(self.likesLabel)
        self.likeStackView.addArrangedSubview(self.viewLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            self.backView.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor),
            self.backView.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor),
            self.backView.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor),
            self.backView.centerYAnchor.constraint(equalTo: self.mainView.centerYAnchor),
            
            self.postAuthorLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 16),
            self.postAuthorLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16),
            self.postAuthorLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16),
            
            self.postImageView.topAnchor.constraint(equalTo: self.postAuthorLabel.bottomAnchor, constant: 12),
            self.postImageView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor),
            self.postImageView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor),
            self.postImageView.heightAnchor.constraint(equalTo: self.backView.widthAnchor, multiplier: 1.0),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16),
            
            self.likeStackView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            self.likeStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16),
            self.likeStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16),
            self.likeStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16),
            
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func tapToClose() {
        removeFromSuperview()
    }
}

// MARK: - extension DetailView

extension DetailPostView: SetupProtocol {
    func setup(with postModel: PostViewProtocol) {
        guard let postModel = postModel as? PostModel else { return }
        self.postAuthorLabel.text = postModel.author
        self.postImageView.image = UIImage(named: postModel.image)
        self.descriptionLabel.text = postModel.description
        self.likesLabel.text = "Likes: " + String(postModel.likes)
        self.viewLabel.text = "Views: " + String(postModel.views)
    }
    
}
