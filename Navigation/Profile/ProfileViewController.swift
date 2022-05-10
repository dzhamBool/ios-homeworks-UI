

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
    }

    override func viewWillLayoutSubviews() {
        let profileHeaderView = ProfileHeaderView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
        profileHeaderView.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        
    }
}

