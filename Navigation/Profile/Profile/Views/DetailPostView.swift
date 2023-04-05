//
//  DetailPostView.swift
//  Navigation
//
//  Created by Svetlana Portnova on 03.04.2023.
//

import UIKit

class DetailPostView: UIView {
    
    private let detailViewPost: UIScrollView = {
        let viewPost = UIScrollView()
        viewPost.translatesAutoresizingMaskIntoConstraints = false
        viewPost.backgroundColor = .white
//        viewPost.clipsToBounds = true
        return viewPost
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
        return imageView
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "close")?.withRenderingMode(.alwaysTemplate)
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
        self.backgroundColor = .systemGray
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
        
        self.addSubview(detailViewPost)
        detailViewPost.addSubview(closeButton)
        detailViewPost.addSubview(authorLabel)
        detailViewPost.addSubview(postImageView)
        detailViewPost.addSubview(descriptionText)
        detailViewPost.addSubview(likesLabel)
        detailViewPost.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            detailViewPost.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            detailViewPost.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailViewPost.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailViewPost.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: detailViewPost.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: detailViewPost.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: detailViewPost.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: detailViewPost.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: detailViewPost.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            postImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionText.leadingAnchor.constraint(equalTo: detailViewPost.leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: detailViewPost.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: detailViewPost.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: detailViewPost.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: detailViewPost.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: detailViewPost.bottomAnchor, constant: -16),
            
            closeButton.topAnchor.constraint(equalTo: detailViewPost.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: detailViewPost.trailingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc private func tapButton() {
        removeFromSuperview()
    }
}
