//
//  SplashScreenViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 19.03.2024.
//

import UIKit

final class SplashScreenViewController: UIViewController{
    let isAuthenticated = true
    let imageView = UIImageView()
    let tokenStorage = TokenStorage()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        switchScreen()
    }
    override func viewDidLoad() {
        configScreen()
        switchScreen()
    }
    
    func configScreen(){
        view.backgroundColor = .white
        configImageView()
        addSubViews()
        activateConstraints()
    }
    
    func configImageView(){
        imageView.image = UIImage(named: "mifiLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
            switchToAuthController()
        }
    }
    
    func switchToTabBar(){
        guard let window = UIApplication.shared.windows.first else {
            assertionFailure("Invalid window configuration")
            return
        }
        let tabBarController = TabBarController()
        window.rootViewController = tabBarController
    }
    
    func switchToAuthController(){
        guard let window = UIApplication.shared.windows.first else {
            assertionFailure("Invalid window configuration")
            return
        }
        let authViewController = AuthViewController()
        authViewController.delegate = self
        let authNavigationController = UINavigationController(rootViewController: authViewController)
        authViewController.modalPresentationStyle = .fullScreen
        present(authNavigationController,animated: true)
    }
}
extension SplashScreenViewController:AuthViewControllerDelegate{
    func authViewController(_ vc: AuthViewController,didAuthenticateWithToken token: String) {
        dismiss(animated: true){ [weak self] in
            guard let self = self else {return}
            self.tokenStorage.token = token
            self.fetchTasks(token)
        }
    }
    
    private func fetchTasks(_ token: String){
        
    }
}
