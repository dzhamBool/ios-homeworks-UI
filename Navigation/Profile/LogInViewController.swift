

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private let nc = NotificationCenter.default
    
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
        //login.keyboardType = .default
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

   private var warningLabel: UILabel = {
        var warning = UILabel()
        warning.translatesAutoresizingMaskIntoConstraints = false
        warning.text = "Пароль должен состоять из 7 символов"
        warning.textColor = .darkGray
        warning.textAlignment = .center
       warning.font = UIFont.systemFont(ofSize: 12, weight: .regular)
       warning.isHidden = true
        return warning
    }()

let login = "111"//"cat@netology.com"
    let password = "111" //"inBoots"

    @objc private func tap() {
        let profileVC = ProfileViewController()
        if loginTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
            loginTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderColor = UIColor.red.cgColor
        } else if loginTextField.text!.isEmpty {
            loginTextField.layer.borderColor = UIColor.red.cgColor
        return
        } else if  passwordTextField.text!.isEmpty {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
       } else if passwordTextField.text!.count < 3 {
           warningLabel.isHidden = false
           self.passwordTextField.text = ""

       } else if loginTextField.text != login && passwordTextField.text != password {

           let alert = UIAlertController(title: "Внимание!", message: "Неверный логин или пароль", preferredStyle: .alert)
           let okActon = UIAlertAction(title: "Retry", style: .default) { _ in
                   self.loginTextField.text = ""
                   self.passwordTextField.text = ""
                   self.dismiss(animated: true)
               }
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                   print("Отмена")
               }
               alert.addAction(okActon)
               alert.addAction(cancelAction)
               present(alert, animated: true)

           }
    else {
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }

    private func layoutWarning() {
        contentView.addSubview(warningLabel)
        NSLayoutConstraint.activate([
            warningLabel.leadingAnchor.constraint(equalTo: logInButton.leadingAnchor),
            warningLabel.trailingAnchor.constraint(equalTo: logInButton.trailingAnchor),
            warningLabel.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -10),
            warningLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
        layoutWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(showKeyBoard), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(hideKeyBoard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func showKeyBoard(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func hideKeyBoard() {
        self.scrollView.contentInset = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func configure() {
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
    }
    var logInTopAnchor = NSLayoutConstraint()
    private func layout() {
        let indent: CGFloat = 16
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        [loginTextField, passwordTextField].forEach { stackViewTextField.addArrangedSubview($0) }
        [logoImage, stackViewTextField, logInButton].forEach { contentView.addSubview($0) }
        
        scrollView.addSubview(contentView)

        logInTopAnchor = logInButton.topAnchor.constraint(equalTo: stackViewTextField.bottomAnchor, constant: 30)

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
            //logInButton.topAnchor.constraint(equalTo: stackViewTextField.bottomAnchor, constant: indent),
            logInTopAnchor,
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indent),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indent),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -indent),

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

