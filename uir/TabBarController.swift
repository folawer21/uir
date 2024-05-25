//
//  TabBarContoller.swift
//  uir
//
//  Created by Александр  Сухинин on 19.03.2024.
//

import UIKit
final class TabBarController: UITabBarController{
    
    func configView(){
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.borderWidth = 2
        
        let taskViewController = TaskViewController()
        taskViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "book.pages"), selectedImage: nil)
        let taskNav = UINavigationController(rootViewController: taskViewController)
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle"), selectedImage: nil)
        let profileNav = UINavigationController(rootViewController: profileViewController)
        
        self.viewControllers = [taskNav,profileNav]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    
}
