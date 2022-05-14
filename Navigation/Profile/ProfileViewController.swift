

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView: ProfileHeaderView = {
let profileView = ProfileHeaderView()
        profileView.backgroundColor = .green

return profileView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        //view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        profileHeaderView.backgroundColor = .lightGray
        //view.addSubview(profileHeaderView)
    }

    private func layout() {
        self.view.addSubview(profileHeaderView)

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            //profileHeaderView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

