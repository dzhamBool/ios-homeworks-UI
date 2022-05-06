
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
    }

}
