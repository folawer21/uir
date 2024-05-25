//
//  AuthHelper.swift
//  uir
//
//  Created by Александр  Сухинин on 21.05.2024.
//

import UIKit

final class AuthHelper{
    weak var viewController: AuthViewController?
    let authService = AuthService()
    let tokenStorage = TokenStorage()
    func auth(login: String,password:String){
        authService.fetchAuthToken(login: login, password: password){ [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let token):
                self.viewController?.successAuth(token)
            case .failure(let error):
                self.viewController?.showAlert()
            }
        }
        
    }
   
//    private func showAlert(){
//        let errorAlert = UIAlertController(title: "Что-то пошло не так", message: "Не удалось войти в систему", preferredStyle: .alert)
//        errorAlert.addAction(UIAlertAction(title: "OK",style: .default, handler: nil ))
//        viewController?.present(errorAlert,animated: true)
//    }
}
