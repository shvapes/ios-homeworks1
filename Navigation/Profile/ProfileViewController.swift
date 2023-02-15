//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    private let newButton: UIButton = {
        let newButton = UIButton()
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.setTitle("New button", for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        newButton.setTitleColor(UIColor.black, for: .highlighted)
        newButton.backgroundColor = .systemBlue
        return newButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        title = "Профиль"
        view.addSubview(newButton)
        profileHeaderViewLayout()
    }
    
    private func profileHeaderViewLayout() {
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}

