

import UIKit

class MainTabBarViewController: UITabBarController {
    let startVC = StartViewController()
    let firstVC = FeedViewController()
    let secondVC = ProfileViewController2()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    private func setupControllers() {

        let startNavController = UINavigationController(rootViewController: startVC)
        startVC.tabBarItem.title = "Главная"
        startVC.tabBarItem.image = UIImage(systemName: "house")

        let firstNavController = UINavigationController(rootViewController: firstVC)
        firstVC.tabBarItem.title = "Лента"
        firstVC.tabBarItem.image = UIImage(systemName: "bookmark")
        firstVC.navigationItem.title = "LENTA"

        let secondNavController = UINavigationController(rootViewController: secondVC)
        secondVC.tabBarItem.title = "Профиль"
        secondVC.tabBarItem.image = UIImage(systemName: "info")
        secondVC.navigationItem.title = "PROFILE"

        viewControllers = [startNavController, firstNavController, secondNavController]
    }

}

