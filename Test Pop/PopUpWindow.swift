//
//  PopUpWindow.swift
//  Test Pop
//
//  Created by Michael Christie on 24/03/2020.
//  Copyright © 2020 Michael Christie. All rights reserved.
//

import UIKit

protocol popupDelegate {
    func handleDismissal()
}

class PopUpWindow: UIView {
    
    //mark properties
    
    var delegate: popupDelegate?
    
    let imageView: UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "Flipside"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 80).isActive = true
        img.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return img
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 24)
        label.text = "Flipside"
        return label
    }()
    
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("View Menu", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        return button
    }()
    
    /*let close: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        return button
    }()*/
    
    
    let close: UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "close"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action:  #selector(handleDismissal))
        img.addGestureRecognizer(tapRecognizer)
        //img.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        
        return img
    }()
    
    //mark init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(close)
        close.heightAnchor.constraint(equalToConstant: 30).isActive = true
        close.widthAnchor.constraint(equalToConstant: 30).isActive = true
        close.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        close.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        addSubview(imageView)
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -28).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(notificationLabel)
        notificationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        notificationLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        
        addSubview(button)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDismissal(){
        print("Dismiss popup")
        delegate?.handleDismissal()
    }
    
}
