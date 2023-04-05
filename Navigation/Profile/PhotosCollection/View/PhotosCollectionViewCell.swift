//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Svetlana Portnova on 28.02.2023.
//

import UIKit

protocol PhotosCollectionViewCellDelegate: AnyObject {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: PhotosCollectionViewCellDelegate?
    
    private var indexPathCell = IndexPath()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImageView)
        addGesture()
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        photoImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.didTapImageInCell(photoImageView.image, frameImage: photoImageView.frame, indexPath: indexPathCell)
    }
}
