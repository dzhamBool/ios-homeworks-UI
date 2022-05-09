
import UIKit

class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        makeButton()
    }
    let firstPost = Post(title: "The first post")

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("POST", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    @ objc private func tapAction() {
        let postPage = PostViewController()
        postPage.post = firstPost
        navigationController?.pushViewController(postPage, animated: true)
    }
}
