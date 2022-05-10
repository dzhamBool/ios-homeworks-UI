

import UIKit

class ProfileHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(avatar)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let avatar: UIImageView = {
        let avatar = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
        avatar.image = UIImage(named: "cat")
        avatar.layer.borderWidth = 3.0
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = 50.0
        avatar.clipsToBounds = true

        return avatar
    }()
}
