//
//  AuthService.swift
//  uir
//
//  Created by Александр  Сухинин on 21.05.2024.
//

import UIKit

enum AuthServiceError: Error{
    case invalidRequest
}

struct AuthAnswer: Codable{
    let auth: String
    let token: String
}

final class AuthService: AuthServiceProtocol{
    private let configuration = Configuration.test
    private let tokenStorage = TokenStorage()
    
    private func makeAuthRequest(login: String,password:String) -> URLRequest?{
        
        guard let url = URL(string: configuration.defaultBaseURL + configuration.authURLString) else {
            return nil}
        var request = URLRequest(url: url)
        let userData = ["login" : login, "password": password]
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: userData, options: [])
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        }catch{
            print("Error converting data to JSON: \(error)")
            return nil
        }
        
    }
    func fetchAuthToken(login: String,password:String,completion: @escaping(Result<String,Error>) -> Void ) {
        guard let request = makeAuthRequest(login: login,password: password) else {
            print("[fetchAuthToken]: AuthServiceError - makingURLRequest")
            completion(.failure(AuthServiceError.invalidRequest))
            return}
        let task = URLSession.shared.objectTask(for: request){ [weak self] (result: Result<AuthAnswer,Error>) in
            guard let self = self else {return }
            switch result{
            case .success(let answerBody):
                let token = answerBody.token
                completion(.success(token))
            case .failure(let error):
                print("[fetchAuthToken]: AuthServiceError - \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
