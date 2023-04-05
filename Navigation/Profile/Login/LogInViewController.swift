//
//  LogInViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 15.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let vkImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logo")
        return $0
    }(UIImageView())
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.placeholder = "Email or phone"
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor = color
        textField.autocapitalizationType = .none
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor = color
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Количество символов должно быть не меньше 3!"
//        label.textColor = .red
//        label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        //        button.setTitleColor(UIColor.black, for: .highlighted)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
//        logInButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        
    }
    
    private func shakeAnimation(textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vkImageView)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
        contentView.addSubview(warningLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            vkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkImageView.widthAnchor.constraint(equalToConstant: 100),
            vkImageView.heightAnchor.constraint(equalToConstant: 100),
            
            emailTextField.topAnchor.constraint(equalTo: vkImageView.bottomAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            warningLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            warningLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    @objc private func tapAction() {
        if emailTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
            shakeAnimation(textField: emailTextField)
            shakeAnimation(textField: passwordTextField)
        } else if emailTextField.text!.isEmpty {
            shakeAnimation(textField: emailTextField)
        } else if passwordTextField.text!.isEmpty {
            shakeAnimation(textField: passwordTextField)
        } else if emailTextField.text != "sveta" || passwordTextField.text != "1234" {
            wrongAlertAction()
        } else {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)
        }
//        } else if passwordTextField.text!.isEmpty {
//            shakeAnimation(textField: passwordTextField)
//        } else {
//            let profileVC = ProfileViewController()
//            navigationController?.pushViewController(profileVC, animated: true)
//        }
        checkLoginButtonStates()
    }
    
    private func wrongAlertAction() {
        let alert = UIAlertController(title: "Непральное имя или пароль", message: "Попробуйте ещё раз", preferredStyle: .alert)
        let agreeAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("Вышли из alert")
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(agreeAction)
        present(alert, animated: true)
    }
    
    private func checkLoginButtonStates() {
        switch logInButton.state {
        case .normal: logInButton.alpha = 1
        case .selected: logInButton.alpha = 0.8
        case .highlighted: logInButton.alpha = 0.8
        case .disabled: logInButton.alpha = 0.8
        default:
            break
        }
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == passwordTextField {
            if textField.text!.count < 3 {
                warningLabel.text = "Количество символов меньше 3!"
                warningLabel.textColor = .red
                warningLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
            } else {
                warningLabel.text = ""
            }
        }
        return true
    }
}
