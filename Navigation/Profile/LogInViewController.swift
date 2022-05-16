

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())

    private let logoImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo")
        return img
    }()

    private let stackViewTextField: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()

    private lazy var loginTextField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = .systemGray6
        login.placeholder = "E-mail or phone"   // в макете "E-mail of phone"
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.autocapitalizationType = .none
        //login.tintColor =
        login.textColor = .black
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.borderWidth = 0.5
        login.layer.cornerRadius = 10
        login.clipsToBounds = true
        login.backgroundColor = .white
        login.keyboardType = .default
        login.delegate = self
      login.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
       login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: login.frame.height))
        login.leftViewMode = .always
        return login
    }()

    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .systemGray6
        password.placeholder = "Password"   // в макете "E-mail of phone"
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.autocapitalizationType = .none
        //login.tintColor =
        password.textColor = .black
        password.isSecureTextEntry = true
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.layer.cornerRadius = 10
        password.clipsToBounds = true
        password.backgroundColor = .white
        password.keyboardType = .default
        password.delegate = self
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: password.frame.height))
        password.leftViewMode = .always
        return password
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        let imageNormal = UIImage(named: "blue_pixel")!.alpha(1.0)
        let imageOther = UIImage(named: "blue_pixel")!.alpha(0.8)
        button.setBackgroundImage(imageNormal, for: .normal)
        button.setBackgroundImage(imageOther, for: .selected)
        button.setBackgroundImage(imageOther, for: .highlighted)
        button.setBackgroundImage(imageOther, for: .disabled)
        button.titleLabel?.textColor = .white
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tap), for:.touchUpInside)
        return button
    }()

    @objc private func tap() {
        let profileVC = ProfileViewController2()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //view.addSubview(logoImage)
        layout()
    }

    private func layout() {
        let indent: CGFloat = 16
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        scrollView.addSubview(contentView)

        [loginTextField, passwordTextField].forEach { stackViewTextField.addArrangedSubview($0) }
        [logoImage, stackViewTextField, logInButton].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            // contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // logoImage
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            // stack
            stackViewTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            stackViewTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indent),
            stackViewTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indent),
            stackViewTextField.heightAnchor.constraint(equalToConstant: 100),
            // logInButton
            logInButton.topAnchor.constraint(equalTo: stackViewTextField.bottomAnchor, constant: indent),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indent),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indent),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: indent)
        ])
    }


}

// MARK: - UIImage
extension UIImage {

    func alpha(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: value)
        let newImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImg!
    }

}
