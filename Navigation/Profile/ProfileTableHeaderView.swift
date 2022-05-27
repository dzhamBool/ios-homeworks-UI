
import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView, UITextFieldDelegate {

    private lazy var blackView: UIView = {
let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var statusText = ""

    private var avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.image = UIImage(named: "cat")
        avatar.layer.borderWidth = 3.0
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = 50.0
        avatar.clipsToBounds = true
        avatar.isUserInteractionEnabled = true
        return avatar
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemGray5
        button.alpha = 0.0
        button.imageView?.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        button.addTarget(self, action: #selector(tapToClose), for: .touchUpInside)
return button
    }()

    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showAvatar))
        avatarImage.addGestureRecognizer(tapGesture)
    }

    @objc private func showAvatar() {
        imagePosition = avatarImage.layer.position
        imageBounds = avatarImage.layer.bounds
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveEaseInOut) {
            self.blackView.alpha = 0.7

            self.avatarImage.center.y = self.blackView.center.y 
            self.avatarImage.center.x = self.blackView.center.x
            self.avatarImage.layer.cornerRadius = 0
            self.avatarImage.layer.borderWidth = 0
            self.avatarImage.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)


        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0) {
                self.layoutIfNeeded()
                self.closeButton.alpha = 1
            }
        }
    }

    private lazy var imagePosition = avatarImage.layer.position
    private lazy var imageBounds = avatarImage.layer.bounds

    @objc private func tapToClose() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveEaseInOut) {
            self.blackView.alpha = 0.0
            self.avatarImage.layer.borderWidth = 3.0
            self.avatarImage.layer.position = self.imagePosition
            self.avatarImage.layer.bounds = self.imageBounds
            self.avatarImage.layer.cornerRadius = self.avatarImage.bounds.width / 2
            self.closeButton.alpha = 0.0
            self.layoutIfNeeded()
        }
    }

    private var nameLabel: UILabel = {
        var name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Puss in Boots"
        name.textColor = .black
        name.textAlignment = .left
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        return name
    }()
    private lazy var setStatusButton: UIButton = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4 * 3
        button.backgroundColor = .systemBlue
        button.setTitle("Set Status", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private var statusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "Waiting for something..."
        status.textAlignment = .left
        status.textColor = .gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return status
    }()

    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your status here"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.borderStyle = .line
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.backgroundColor = .white
        textField.keyboardType = .default
        textField.delegate = self
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()

    override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
        addView()
        bringSubviewToFront(avatarImage)
        setupGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if let text =  textField.text {
            self.statusLabel.text = text
        }
        return true
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""

    }
    @objc private func buttonPressed() {
        if statusTextField.text!.isEmpty {
            statusTextField.layer.borderColor = UIColor.red.cgColor
            statusTextField.backgroundColor = .gray
        } else {
        self.statusLabel.text = statusText
            statusTextField.layer.borderColor = UIColor.black.cgColor
            statusTextField.backgroundColor = .white
            statusTextField.text = ""
        }
    }

    private func addView() {
        [avatarImage, nameLabel, statusLabel, statusTextField, setStatusButton].forEach {addSubview( $0 )}

        addSubview(blackView)

        NSLayoutConstraint.activate([
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            blackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        blackView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)

        addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: blackView.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -16)
            ])

        NSLayoutConstraint.activate([

            // avatar
            avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            // name
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: self.avatarImage.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            //button
            setStatusButton.topAnchor.constraint(equalTo: self.avatarImage.bottomAnchor, constant: 35),
            setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            // current status
            statusLabel.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -64),
            statusLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            // set status text
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

}
