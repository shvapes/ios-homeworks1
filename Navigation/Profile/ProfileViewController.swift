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
        postTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return postTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
//        title = "Профиль"
        view.addSubview(postTableView)
        profileHeaderViewLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
           return postModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: postModel[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        }
        return nil
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
//            present(photosVC, animated: true)
//            UINavigationController.push()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
