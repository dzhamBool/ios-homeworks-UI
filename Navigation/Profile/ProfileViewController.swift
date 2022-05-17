

import UIKit

class ProfileViewController: UIViewController {

    private let post = Post.makeMockModel()

    private lazy var postTable: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            layout()
        }

    private func layout() {
        view.addSubview(postTable)
        NSLayoutConstraint.activate([
            postTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath)

        return cell
    }
}
// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

}

//    let profileHeaderView: ProfileHeaderViewConstr = {
//        let profileView = ProfileHeaderViewConstr()
//        profileView.backgroundColor = .green
//
//        return profileView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        layout()
//    }
//
//    override func viewWillLayoutSubviews() {
//        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
//        profileHeaderView.backgroundColor = .lightGray
//    }
//
//    private func layout() {
//        view.addSubview(profileHeaderView)
//
//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            profileHeaderView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -220),
//        ])
//    }
//}

