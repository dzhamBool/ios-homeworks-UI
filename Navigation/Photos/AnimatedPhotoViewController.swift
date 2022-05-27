

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

    @objc func tapToClose() {
        closeLargeImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.0)
        layout()
        launch()
        self.view.layoutIfNeeded()
    }

    private func layout() {
        [largeImage, closeButton].forEach {view.addSubview( $0 )}

        let inset: CGFloat = 16

        positionXLargeImage = self.largeImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        positionYLargeImage = self.largeImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        widthLargeImage = self.largeImage.widthAnchor.constraint(equalToConstant: 140)
        heightLargeImage = self.largeImage.heightAnchor.constraint(equalToConstant: 140)

        NSLayoutConstraint.activate([

            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: inset),
            closeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            positionXLargeImage, positionYLargeImage, widthLargeImage, heightLargeImage
        ].compactMap({ $0 }) )
    }
    func launch() {
        NSLayoutConstraint.deactivate([
        self.positionXLargeImage, self.positionYLargeImage, self.widthLargeImage, self.heightLargeImage
        ].compactMap( {$0} ))

        self.widthLargeImage = self.largeImage.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        self.heightLargeImage = self.largeImage.heightAnchor.constraint(equalTo: self.view.widthAnchor)
        self.positionXLargeImage = self.largeImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.positionYLargeImage = self.largeImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)

        NSLayoutConstraint.activate([
            self.positionXLargeImage, self.positionYLargeImage, self.widthLargeImage, self.heightLargeImage
        ].compactMap( {$0} ))
        self.largeImage.layer.cornerRadius = 0.0
        self.view.backgroundColor = .black.withAlphaComponent(0.8)

        UIView.animate(withDuration: 1, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.25) {
                self.closeButton.alpha = 1
            }
        }
    }

    func closeLargeImage() {
        NSLayoutConstraint.deactivate([
            self.positionXLargeImage, self.positionYLargeImage, self.widthLargeImage, self.heightLargeImage
        ].compactMap( {$0} ))

        self.widthLargeImage = self.largeImage.widthAnchor.constraint(equalToConstant: 140)
        self.heightLargeImage = self.largeImage.heightAnchor.constraint(equalToConstant: 140)
        self.positionXLargeImage = self.largeImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.positionYLargeImage = self.largeImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)

        NSLayoutConstraint.activate([
            self.positionXLargeImage, self.positionYLargeImage, self.widthLargeImage, self.heightLargeImage
        ].compactMap( {$0} ))
        self.largeImage.layer.cornerRadius = 70.0
        self.view.backgroundColor = .black.withAlphaComponent(0.8)
        self.closeButton.alpha = 0.0

        UIView.animate(withDuration: 1, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            self.view.removeFromSuperview()
            self.tabBarController?.tabBar.isHidden = false
            self.navigationController?.navigationBar.isHidden = false
        }
    }
}

// MARK: - AnimatedPhotoViewController: SetupProtocol
extension AnimatedPhotoViewController: SetupProtocol {
    func setup(with postModel: PostViewProtocol) {
        guard let postModel = postModel as? ViewModel else { return }
        self.largeImage.image = UIImage(named: postModel.image)
    }
}
