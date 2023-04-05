//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Svetlana Portnova on 28.02.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    let allOffsets = 48
    
    private let photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.tintColor = .black
        label.text = "Photos"
        return label
    }()
    
    private lazy var arrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(openPhotoGallery), for: .touchUpInside)
        return button
    }()
    
    private let photosImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    private let photosImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "2")
        return imageView
    }()
    
    private let photosImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "3")
        return imageView
    }()
    
    private let photosImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "4")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(photosImageView1)
        contentView.addSubview(photosImageView2)
        contentView.addSubview(photosImageView3)
        contentView.addSubview(photosImageView4)
        
        NSLayoutConstraint.activate([
            
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photosImageView1.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosImageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosImageView1.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - CGFloat(allOffsets)) / 4),
            photosImageView1.heightAnchor.constraint(equalToConstant:(UIScreen.main.bounds.width - CGFloat(allOffsets)) / 4),
            photosImageView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            photosImageView2.topAnchor.constraint(equalTo: photosImageView1.topAnchor),
            photosImageView2.leadingAnchor.constraint(equalTo: photosImageView1.trailingAnchor, constant: 8),
            photosImageView2.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - CGFloat(allOffsets)) / 4),
            photosImageView2.heightAnchor.constraint(equalToConstant:(UIScreen.main.bounds.width - CGFloat(allOffsets)) / 4),
            
            photosImageView3.topAnchor.constraint(equalTo: photosImageView1.topAnchor),
            photosImageView3.leadingAnchor.constraint(equalTo: photosImageView2.trailingAnchor, constant: 8),
            photosImageView3.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - CGFloat(allOffsets)) / 4),
            photosImageView3.heightAnchor.constraint(equalToConstant:(UIScreen.main.bounds.width - CGFloat(allOffsets)) / 4),
            
            photosImageView4.topAnchor.constraint(equalTo: photosImageView1.topAnchor),
            photosImageView4.leadingAnchor.constraint(equalTo: photosImageView3.trailingAnchor, constant: 8),
            photosImageView4.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - CGFloat(allOffsets)) / 4),
            photosImageView4.heightAnchor.constraint(equalToConstant:(UIScreen.main.bounds.width - CGFloat(allOffsets)) / 4),
            photosImageView4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
    
    weak var delegate: PhotosTableViewCellDelegate?
    
    @objc private func openPhotoGallery() {
        delegate?.tapAction()
    }
}

protocol PhotosTableViewCellDelegate: AnyObject {
    func tapAction()
}
