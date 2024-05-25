//
//  AuthServiceProtocol.swift
//  uir
//
//  Created by Александр  Сухинин on 21.05.2024.
//

import Foundation
protocol AuthServiceProtocol{
    func fetchAuthToken(login: String,password:String,completion: @escaping(Result<String,Error>) -> Void )
}
