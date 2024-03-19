//
//  AuthViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 18.03.2024.
//

import UIKit

final class AuthViewController: UIViewController{
    
    let authLabel = UILabel()
    let loginButton = UIButton()
    let loginInputLabel = UITextField()
    let passwordInputLabel = UITextField()
    let borderView = UIView()
    let authTextView = UIView()
    let logoView = UIImageView()
    func configViews(){
        view.backgroundColor = .white
        configBorderView()
        configAuthView()
        configAuthLabel()
        configLoginInputLabel()
        configPasswordInputLabel()
        configLoginButton()
        configLogoView()
    }
    func configBorderView(){
        borderView.backgroundColor = UIColor(named: "greyForView")
        borderView.layer.cornerRadius = 20
        borderView.layer.borderWidth = 2
        borderView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configAuthView(){
        authTextView.backgroundColor = UIColor(named: "greyForView")
        authTextView.layer.cornerRadius = 20
        authTextView.layer.borderWidth = 2
        authTextView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configAuthLabel(){
        authLabel.text = "Авторизация"
        authLabel.textColor = .black
        authLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configLoginInputLabel(){
        loginInputLabel.placeholder = "Логин"
        loginInputLabel.clearButtonMode = .whileEditing
        loginInputLabel.textColor = .black
        loginInputLabel.backgroundColor = .white
        loginInputLabel.textAlignment = .left
        loginInputLabel.layer.cornerRadius = 5
        loginInputLabel.layer.borderWidth = 1
        loginInputLabel.translatesAutoresizingMaskIntoConstraints = false
        loginInputLabel.indent(size: 12)
    }
    
    func configPasswordInputLabel(){
        passwordInputLabel.placeholder = "Пароль"
        passwordInputLabel.clearButtonMode = .whileEditing
        passwordInputLabel.textColor = .black
        passwordInputLabel.backgroundColor = .white
        passwordInputLabel.textAlignment = .left
        passwordInputLabel.layer.cornerRadius = 5
        passwordInputLabel.layer.borderWidth = 1
        passwordInputLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordInputLabel.indent(size: 12)
    }
    
    func configLoginButton(){
        loginButton.setTitle("Войти", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 25
        loginButton.layer.borderWidth = 1
        loginButton.addTarget(self, action: #selector(loginButtonTapped) , for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configLogoView(){
        logoView.image = UIImage(named: "mifiLogo")
        logoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubViews(){
        viewSubViews()
        authTextViewSubViews()
        borderViewSubViews()
    }
    
    func viewSubViews(){
        view.addSubview(borderView)
        view.insertSubview(authTextView, belowSubview: borderView)
        view.addSubview(logoView)
    }
    
    func authTextViewSubViews(){
        authTextView.addSubview(authLabel)
    }
    
    func borderViewSubViews(){
        borderView.addSubview(loginInputLabel)
        borderView.addSubview(passwordInputLabel)
        borderView.addSubview(loginButton)
    }

    func activateConstraints(){
        NSLayoutConstraint.activate([
            borderView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            borderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            borderView.heightAnchor.constraint(equalToConstant: 215),
            borderView.widthAnchor.constraint(equalToConstant: 322),
            
            authTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            authTextView.bottomAnchor.constraint(equalTo: borderView.topAnchor,constant: 20),
            authTextView.heightAnchor.constraint(equalToConstant: 51),
            authTextView.widthAnchor.constraint(equalToConstant: 217),
            
            logoView.topAnchor.constraint(equalTo: borderView.bottomAnchor, constant: 100),
            logoView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            authLabel.centerXAnchor.constraint(equalTo: authTextView.centerXAnchor),
            authLabel.topAnchor.constraint(equalTo: authTextView.topAnchor, constant: 5),
            
            loginInputLabel.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 36),
            loginInputLabel.centerXAnchor.constraint(equalTo: borderView.centerXAnchor),
            loginInputLabel.widthAnchor.constraint(equalToConstant: 260),
            loginInputLabel.heightAnchor.constraint(equalToConstant: 35),

            passwordInputLabel.topAnchor.constraint(equalTo: loginInputLabel.bottomAnchor, constant: 21),
            passwordInputLabel.centerXAnchor.constraint(equalTo: borderView.centerXAnchor),
            passwordInputLabel.widthAnchor.constraint(equalToConstant: 260),
            passwordInputLabel.heightAnchor.constraint(equalToConstant: 35),

            loginButton.topAnchor.constraint(equalTo: passwordInputLabel.bottomAnchor, constant: 26),
            loginButton.centerXAnchor.constraint(equalTo: borderView.centerXAnchor),
            loginButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 112),
            loginButton.heightAnchor.constraint(equalToConstant: 37)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        addSubViews()
        activateConstraints()
        
    }
    
    @objc
    func loginButtonTapped(){
        print(2)
    }
    
    func switchToTabBar(){
        guard let window = UIApplication.shared.windows.first else {
            assertionFailure("Invalid window configuration")
            return
        }
        let tabBarController = TabBarController()
        window.rootViewController = tabBarController
    }
}
