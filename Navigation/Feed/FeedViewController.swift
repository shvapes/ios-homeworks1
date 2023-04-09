//
//  FeedViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private lazy var postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Выбрать пост", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
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
    }
    
    @objc private func tapAction() {
        let postVC = PostViewController()
        print("textForLabel - \(postVC.textForLabel)")
        navigationController?.pushViewController(postVC, animated: true)
    }
}

