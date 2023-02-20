//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    let postModel = Post.makeMockPost()
    
    let profileHeaderView = ProfileHeaderView()
    
    private lazy var postTableView: UITableView = {
        let postTableView = UITableView(frame: .zero, style: .grouped)
        postTableView.dataSource = self
        postTableView.delegate = self
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return postTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Профиль"
        view.addSubview(postTableView)
        profileHeaderViewLayout()
    }
    
    private func profileHeaderViewLayout() {
                
        NSLayoutConstraint.activate([
            
            postTableView.topAnchor.constraint(equalTo: view.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(model: postModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        return header
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
