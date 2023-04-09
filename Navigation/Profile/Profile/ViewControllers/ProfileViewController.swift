//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

class ProfileViewController: UIViewController, PhotosTableViewCellDelegate {
    
    func tapAction() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
    
    // MARK: - variable and constant
    var postModel = Post.makeMockPost()
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
    
    // MARK: - lifycycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(postTableView)
        profileHeaderViewLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - private methodes
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
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.delegate = self
            cell.setupCell(model: self.postModel[indexPath.row])
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
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            tableView.allowsSelection = false
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 0 {
            return .none
        } else {
            return .delete
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        self.postModel.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
}

extension ProfileViewController: PostTableViewCellProtocol {
    
    func tapLike(cell: PostTableViewCell) {
        guard let index = self.postTableView.indexPath(for: cell)?.row else { return }
        let indexPath = IndexPath(row: index, section: 1)
        self.postModel[indexPath.row].likes += 1
        print(postModel[indexPath.row].likes)
        self.postTableView.reloadRows(at: [indexPath], with: .none)
        print([indexPath.row])
    }
    
    func tapPost(cell: PostTableViewCell) {
        let detailPost = DetailPostView()
        guard let index = self.postTableView.indexPath(for: cell)?.row else { return }
        let indexPath = IndexPath(row: index, section: 1)
        self.postModel[indexPath.row].views += 1
        let postModify = self.postModel[indexPath.row]
        detailPost.setupCell(model: postModify)
        self.view.addSubview(detailPost)
        detailPost.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailPost.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailPost.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailPost.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailPost.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        self.postTableView.reloadRows(at: [indexPath], with: .none)
    }
}
