//
//  FeedViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
   
    let post = Post(title: "Первый пост")
    
    private let postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Выбрать пост", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(postButton)
        postButton.center = view.center
        postButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc private func tapAction() {
        let postVC = PostViewController()
//        postVC.title = post.title
        postVC.textForLabel = post.title
        print("textForLabel - \(postVC.textForLabel)")
        navigationController?.pushViewController(postVC, animated: true)
    }
}

