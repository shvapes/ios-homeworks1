//
//  PostViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
    var textForLabel: String = ""
//
//    private let myLabel: UILabel = {
//        let label = UILabel(frame: CGRect(x: 20, y: 150, width: 200, height: 40))
//        label.backgroundColor = .red
//        return label
//    }()
//
//    init(textForLabel: String? = nil) {
//        self.textForLabel = textForLabel
//        super.init(nibName: nil, bundle: nil)
//        myLabel.text = textForLabel
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
//        view.addSubview(myLabel)
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
