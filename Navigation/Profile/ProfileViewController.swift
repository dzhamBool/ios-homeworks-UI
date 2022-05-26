

import UIKit

class ProfileViewController: UIViewController {
    
    let photosList = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9", "image10", "image11", "image12", "image13", "image14", "image16", "image17","image18", "image19", "image20"]

    private let post: [PostModel] = PostModel.makeMockModel()
    
    private lazy var postTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileTableHeaderView.identifier)
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func layout() {
        view.addSubview(postTable)
        
        NSLayoutConstraint.activate([
            postTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            postTable.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            postTable.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            postTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
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
            cell.photos = photosList
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.selectionStyle = .none
       // cell.delegate = self
        
        cell.setupCell(post[indexPath.row])
    
        return cell
    }
}
// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //        let headerView = ProfileHeaderViewConstr(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 220))
                let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHeaderView.identifier) as! ProfileTableHeaderView
                //view.delegate = self
                return section == 0 ? headerView : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailPostView = DetailPostView()
      //  detailPostView.setupView(post: post[indexPath.section][indexPath.row])
    }
}

// MARK: - PhotosTableViewCellDelegate
extension ProfileViewController: PhotosTableViewCellDelegate {
    func buttonTap() {
        let photosVC = PhotosViewController()
        photosVC.photos = photosList
        navigationController?.pushViewController(photosVC, animated: true)
    }
}

// MARK: - PostTableViewCellProtocol
//extension ProfileViewController: PostTableViewCellProtocol {
//    func tapPostImageViewGestureRecognizerDelegate(cell: PostTableViewCell) {
//
//    }
//
//    func tapLikesLabelGestureRecognizerDelegate(cell: PostTableViewCell) {
//       guard let index = self.tableView.indexPath(for: cell).row else { return }
//        let i = self.tableView.indexPath(for: cell)?.row
//        let ip = IndexPath(
//                let indexPath = IndexPath(row: index, section: 1)
//                post[index].likes += 1
//                    self.tableView.reloadRows(at: [indexPath], with: .fade)
//    }
//
//}

