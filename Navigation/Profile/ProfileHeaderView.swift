//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Svetlana Portnova on 13.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
//констрейнты в коде еще не проходили на этом этапе, поэтому задавала через frame
    
    private let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cat"))
        image.frame = CGRect(x: 16, y: 116, width: 120, height: 120)
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = true
        return image
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 127, width: 150, height: 40))
        label.text = "Hipster Cat"
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 258, width: UIScreen.main.bounds.width - 32, height: 50))
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.black, for: .highlighted)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    private let textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 150, y: 210, width: 250, height: 14))
        textField.placeholder = "Waiting for something..."
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .gray
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(textLabel)
        addSubview(button)
        addSubview(textField)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed() {
        print(textField.text ?? "")
    }
}
