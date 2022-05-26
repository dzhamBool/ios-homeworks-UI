//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Игорь Мунгалов on 26.05.2022.
//

import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {

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
        let centrYScreen = UIScreen.main.bounds.height / 2 - 50
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.blackView.alpha = 0.7
            self.avatarImage.center.y = centrYScreen
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
                       usingSpringWithDamping: 0.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.blackView.alpha = 0.7
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

}
