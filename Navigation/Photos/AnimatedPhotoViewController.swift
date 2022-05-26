//
//  AnimatedPhotoViewController.swift
//  Navigation
//
//  Created by Игорь Мунгалов on 27.05.2022.
//

import UIKit

class AnimatedPhotoViewController: UIViewController {

    struct ViewModel: PostViewProtocol {
        var image: String
    }

    private lazy var largeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue

        return imageView
    }()

    private var widthLargeImage = NSLayoutConstraint()
    private var heightLargeImage = NSLayoutConstraint()
    private var positionXLargeImage = NSLayoutConstraint()
    private var positionYLargeImage = NSLayoutConstraint()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "cancel")
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.0)
        layout()
        launch()
        self.view.layoutIfNeeded()
    }

    private func layout() {
        [largeImage, backButton].forEach {view.addSubview( $0 )}

        let inset: CGFloat = 16

     positionXLargeImage = self.largeImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        positionYLargeImage = self.largeImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        widthLargeImage = self.largeImage.widthAnchor.constraint(equalToConstant: 140)
        heightLargeImage = self.largeImage.heightAnchor.constraint(equalToConstant: 140)

        NSLayoutConstraint.activate([

            backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: inset),
            backButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            // image
            positionXLargeImage, positionYLargeImage, widthLargeImage, heightLargeImage
        ].compactMap({ $0 }) )
    }
    func launch() {

    }

    @objc func tapAction() {
launch()
}
}
