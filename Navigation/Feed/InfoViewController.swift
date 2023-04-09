//
//  InfoViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

final class InfoViewController: UIViewController {
    
    private lazy var showAlertButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Показать алерт", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(showAlertButton)
        showAlertButton.center = view.center
    }
    
    @objc private func backAction() {
        let alert = UIAlertController(title: "Выйти из инфо", message: "Вы точно хотите выйти?", preferredStyle: .alert)
        let agreeAction = UIAlertAction(title: "Да", style: .default) { _ in
            print("Вышли из инфо")
            self.navigationController?.popViewController(animated: true)
        }
        let disagreeAction = UIAlertAction(title: "Нет", style: .destructive) { _ in
            print("Вернулись в инфо")
        }
        alert.addAction(disagreeAction)
        alert.addAction(agreeAction)
        present(alert, animated: true)
    }
}
