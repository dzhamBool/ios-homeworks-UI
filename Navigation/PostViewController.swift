
import UIKit

struct Post {
var title: String
}

class PostViewController: UIViewController {

    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = post?.title
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
