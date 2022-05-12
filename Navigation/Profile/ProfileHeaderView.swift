

import UIKit

class ProfileHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(avatar)
        addSubview(nameLabel)
        addSubview(status)
        addSubview(button)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private var avatar: UIImageView = {
        let avatar = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
        avatar.image = UIImage(named: "cat")
        avatar.layer.borderWidth = 3.0
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = 50.0
        avatar.clipsToBounds = true
        return avatar
    }()
    private var nameLabel: UILabel = {
        var name = UILabel(frame: CGRect(x: 150, y: 27, width: 200, height: 30))
        name.text = "Puss in Boots"
        name.textColor = .black
        name.textAlignment = .left
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        //name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    private lazy var button: UIButton = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        var button = UIButton(frame: CGRect(origin: .init(x: 16, y: 132), size: CGSize(width: screenWidth - 32, height: 50)))
        button.layer.cornerRadius = 4 * 3
        button.backgroundColor = .systemBlue
        button.setTitle("Show Status", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    @objc private func buttonPressed() {
        print(#function)
        print(status.text!)
    }
    private var status: UILabel = {
        let status = UILabel(frame: CGRect(x: 150, y: 81, width: 200, height: 30))
        status.text = "Waiting for something..."
        status.textAlignment = .left
        status.textColor = .gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return status
    }()
}

