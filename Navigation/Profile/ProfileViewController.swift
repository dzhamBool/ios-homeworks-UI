

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView: ProfileHeaderViewConstr = {
        let profileView = ProfileHeaderViewConstr()
        profileView.backgroundColor = .green

        return profileView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        profileHeaderView.backgroundColor = .lightGray
        layout()
    }
    
//    override func viewWillLayoutSubviews() {
//        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
//        profileHeaderView.backgroundColor = .lightGray
//    }

    private func layout() {
        view.addSubview(profileHeaderView)

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}

