//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Svetlana Portnova on 17.02.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.tintColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        //        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.tintColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.tintColor = .black
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.tintColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Post) {
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)
        descriptionText.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
    
    private func layout() {
//        [contentWhiteView, authorLabel, postImageView, descriptionText, likesLabel, viewsLabel].forEach {
//            contentView.addSubview($0) }
        contentView.addSubview(contentWhiteView)
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionText)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            postImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionText.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16)
        ])
    }
}
