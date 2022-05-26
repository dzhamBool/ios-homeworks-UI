//
//  DetailPostView.swift
//  Navigation
//
//  Created by Игорь Мунгалов on 25.05.2022.
//

import UIKit

class DetailPostView: UIView {

    struct PostModel {
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
    }


    let postAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    let postImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .black
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        // label.isUserInteractionEnabled = true
        return label
    }()

    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()

    func setupView(post: PostModel) {
        postAuthorLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: " + String(post.likes)
        viewsLabel.text = "Views: " + String(post.views)
    }
}
