//
//  SplashScreenViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 19.03.2024.
//

import UIKit

final class SplashScreenViewController: UIViewController{
    let isAuthenticated = false
    let imageView = UIImageView()
    
    
    override func viewDidLoad() {
        configScreen()
        
    }
    
    func configScreen(){
        configImageView()
        addSubViews()
        activateConstraints()
    }
    
    func configImageView(){
        imageView.image = UIImage(named: "mifiLogo")
    }
    
    func addSubViews(){
        view.addSubview(imageView)
    }
    
    func activateConstraints(){
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    func switchScreen(){
        if isAuthenticated{
            switchToTabBar()
        }else{
            
        }
    }
    
    func switchToTabBar(){
        guard let window = UIApplication.shared.windows.first else {
            assertionFailure("Invalid window configuration")
        }
        let tabBarController = TabBarController()
        window.rootViewController = tabBarController
    }
    
    func switchToAuthController(){
        guard let window = UIApplication.shared.windows.first else {
            assertionFailure("Invalid window configuration")
        }
        let authViewController = AuthViewController()
        window.rootViewController = authViewController
    }
}
