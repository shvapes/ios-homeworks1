//
//  PostViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
    var textForLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = textForLabel
        makeBarItem()
    }
    
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barItem
    }
    
    @objc private func barItemAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}
