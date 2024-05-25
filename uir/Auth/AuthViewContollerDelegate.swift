//
//  AuthViewContollerDelegate.swift
//  uir
//
//  Created by Александр  Сухинин on 25.05.2024.
//

import UIKit

protocol AuthViewControllerDelegate: AnyObject{
    func authViewController(_ vc: AuthViewController,didAuthenticateWithToken token: String)
}
