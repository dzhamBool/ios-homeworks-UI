
import UIKit

class PostViewController: UIViewController {
    var post: PostModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = post?.author
        view.backgroundColor = .orange
        makeInfoButton()
    }
    private func makeInfoButton() {
        let barButton = UIBarButtonItem(title: "FORVARD", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barButton
    }
    @objc private func tapAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}
