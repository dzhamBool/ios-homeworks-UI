
import UIKit

class ProfileViewController2: UIViewController {

    private let profileheaderView: UIView = {
        let view = ProfileHeaderViewConstr()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    private let uselessButton: UIButton = {
        let button = UIButton()

        button.setTitle("Useless Button", for: .normal)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()

    @objc private func tapAction(){
        print(#function)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {

        self.view.backgroundColor = .white
        view.addSubview(profileheaderView)
        view.addSubview(uselessButton)

        NSLayoutConstraint.activate([
            // profileheaderView
            profileheaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileheaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileheaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileheaderView.heightAnchor.constraint(equalToConstant: 220),
            // button
            uselessButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            uselessButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            uselessButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            uselessButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
