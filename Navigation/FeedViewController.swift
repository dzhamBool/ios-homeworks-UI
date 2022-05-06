
import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        makeButton()
    }
    
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
        present(postPage, animated: true)
    }

//        let barItem = UIBarButtonItem(title: "POST", style: .plain, target: self, action: #selector(tapAction))
//        navigationItem. = barItem
//    }
//    @objc private func tapAction() {
//
//    }
}
