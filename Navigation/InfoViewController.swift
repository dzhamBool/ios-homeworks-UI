
import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        makeButton()
    }

    private func makeButton() {
let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Просмотрено", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc private func tapAction() {
        let alert = UIAlertController(title: "Attention!", message: "Хотите покинуть страницу?", preferredStyle: .alert)
        let okActon = UIAlertAction(title: "Yes", style: .default) { _ in
            print("Прочитано")
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
print("Отмена")
        }
        alert.addAction(cancelAction)
        alert.addAction(okActon)
        present(alert, animated: true)
    }
}
