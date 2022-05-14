//
//  Test.swift
//  Navigation
//
//  Created by Игорь Мунгалов on 14.05.2022.
//

import UIKit

class Test: UIView {

    //class ProfileTableHeaderView: UITableViewHeaderFooterView {
        private var statusText : String = ""

        private let fullNameLabel: UILabel = {
            let view = UILabel()
            view.text = "Hipster Pinguin"
            view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            view.textColor = .black
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        private let avatarImage: UIImageView = {
            let view = UIImageView() //(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
            view.clipsToBounds = true
            view.layer.borderWidth = 3
            view.layer.borderColor = UIColor.white.cgColor
            view.image = UIImage(named: "cat")
            view.contentMode = .scaleAspectFill
            view.layer.cornerRadius = 100/2
            view.translatesAutoresizingMaskIntoConstraints = false

    //        let tapGesture = UITapGestureRecognizer(target : self, action : #selector(avatarImagePressHandler))
    //        view.isUserInteractionEnabled = true
    //        view.addGestureRecognizer(tapGesture)

            return view
        }()


        let statusLabel: UILabel = {
            let view = UILabel()
            view.text = "Waiting for something"
            view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            view.textColor = .gray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        let statusTextField: UITextField = {
            let view = UITextField()
            view.placeholder = "add smth to show as status"
            view.layer.cornerRadius = 12
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.black.cgColor
            view.backgroundColor = .white
            view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            view.textColor = .black
            view.backgroundColor = .white.withAlphaComponent(0)
            view.addTarget(self, action: #selector(statusTextChanged), for : .editingChanged)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        let setStatusButton: UIButton = {
            let view = UIButton()
            view.setTitle("Show status", for: .normal)
            view.setTitleColor(.white, for : .normal)
            view.backgroundColor = UIColor(named: "myColor")
            view.layer.cornerRadius = 14
            view.layer.shadowRadius = 4
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.7
            view.layer.shadowOffset = CGSize(width: 4, height: 4)
            view.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()


        
        override init(frame: CGRect) {
            super.init(frame: frame)
            //addSubview(avatarImage)
            setupViews()
        }

        @objc func avatarImagePressHandler()
        {
            print("avatar pressed")
        }

        @objc func buttonPressed()
        {
            statusLabel.text = statusText
        }

        @objc func statusTextChanged(_ textField: UITextField)
        {
            statusText = textField.text ?? ""
        }

        required init?(coder: NSCoder) {
            fatalError("should not be called")
        }


        private func setupViews()
        {
            self.addSubview(avatarImage)
            self.addSubview(fullNameLabel)
            self.addSubview(statusLabel)
            self.addSubview(statusTextField)
            self.addSubview(setStatusButton)

            let tapGesture = UITapGestureRecognizer(target : self, action : #selector(avatarImagePressHandler))
            avatarImage.isUserInteractionEnabled = true
            avatarImage.addGestureRecognizer(tapGesture)

            let constraints = [
                avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
                avatarImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                avatarImage.widthAnchor.constraint(equalToConstant: 100),
                avatarImage.heightAnchor.constraint(equalToConstant: 100),

                fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
                fullNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

                statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
                statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
                statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),

                statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
                statusTextField.heightAnchor.constraint(equalToConstant: 40),
                statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
                statusTextField.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor),

                setStatusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 16),
                setStatusButton.leadingAnchor.constraint(equalTo: avatarImage.leadingAnchor),
                setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50)
            ]

            NSLayoutConstraint.activate(constraints)
        }

    }

//}
