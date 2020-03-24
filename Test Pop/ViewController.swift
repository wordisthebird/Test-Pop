//
//  ViewController.swift
//  Test Pop
//
//  Created by Michael Christie on 24/03/2020.
//  Copyright © 2020 Michael Christie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Mark : - Properties
    
    lazy var popUpView: PopUpWindow = {
        let view = PopUpWindow()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.delegate = self
        return view
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Show pop up window", for: .normal)
        button.setTitleColor(UIColor.mainBlue(), for: .normal)
        button.addTarget(self, action: #selector(handleShowPop), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)
        
        view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @objc func handleShowPop(){
        
        view.addSubview(popUpView)
        popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: view.frame.width - 104).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: view.frame.width - 104).isActive = true
        
        popUpView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpView.alpha = 0
        
        UIView.animate(withDuration: 0.5){
            self.visualEffectView.alpha = 1
            self.popUpView.alpha = 1
            self.popUpView.transform = CGAffineTransform.identity
        }
        
        
    }
}

extension ViewController: popupDelegate{
    
    func handleDismissal() {
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.popUpView.alpha = 0
            self.popUpView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.popUpView.removeFromSuperview()
            print("Removed popup")
        }
    }
    
}

extension UIColor{
    static func mainBlue() -> UIColor{
        return UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)
    }
}

