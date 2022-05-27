

import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileTableHeaderView.identifier)
        tableView.rowHeight = UITableView.automaticDimension

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func layout() {
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            cell.layer.shouldRasterize = true
            cell.layer.rasterizationScale = UIScreen.main.scale
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.selectionStyle = .none
            cell.delegate = self
            let article = post[indexPath.row]
            let postModel = PostTableViewCell.PostModel(author: article.author, description: article.description, image: article.image, likes: article.likes, views: article.views)
            cell.setup(postModel)
            return cell
        }
    }
}
// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHeaderView.identifier) as! ProfileTableHeaderView
        return section == 0 ? headerView : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }
}

// MARK: - PhotosTableViewCellProtocol
extension ProfileViewController: PhotosTableViewCellProtocol {
    func delegateButtonAction(cell: PhotosTableViewCell) {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
}

// MARK: - PostTableViewCellProtocol
extension ProfileViewController: PostTableViewCellProtocol {
    func tapPostImageViewGestureRecognizerDelegate(cell: PostTableViewCell) {
        let presentPostVC = DetailPostView()
        guard let index = self.tableView.indexPath(for: cell)?.row else { return }
        let indexPath = IndexPath(row: index, section: 1)
        post[indexPath.row].views += 1
        let article = post[indexPath.row]
        let postModel = DetailPostView.PostModel(
            author: article.author,
            description: article.description,
            image: article.image,
            likes: article.likes,
            views: article.views)

        presentPostVC.setup(with: postModel)
        self.view.addSubview(presentPostVC)
        presentPostVC.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            presentPostVC.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            presentPostVC.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            presentPostVC.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            presentPostVC.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        self.tableView.reloadRows(at: [indexPath], with: .fade)
    }

    func tapLikesLabelGestureRecognizerDelegate(cell: PostTableViewCell) {
        guard let index = self.tableView.indexPath(for: cell)?.row else { return }
        let indexPath = IndexPath(row: index, section: 1)
        post[index].likes += 1
        self.tableView.reloadRows(at: [indexPath], with: .fade)
    }
}





