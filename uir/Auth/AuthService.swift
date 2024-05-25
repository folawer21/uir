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
final class AuthService: AuthServiceProtocol{
    private let configuration = Configuration.test
    private let tokenStorage = TokenStorage()
    
    private func makeAuthUrl(login: String,password:String) -> URL?{
        var urlComponents = URLComponents(string: configuration.authURLString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "login", value: login),
            URLQueryItem(name: "password", value: password)
        ]
        guard let url = urlComponents?.url else {
            return nil
        }
        return url
    }
    
    private func makeAuthRequest(login: String,password:String) -> URLRequest?{
        guard let url = makeAuthUrl(login: login, password: password) else {
            return nil}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
    func fetchAuthToken(login: String,password:String,completion: @escaping(Result<String,Error>) -> Void ) {
        guard let request = makeAuthRequest(login: login,password: password) else {
            print("[fetchAuthToken]: AuthServiceError - makingURLRequest")
            completion(.failure(AuthServiceError.invalidRequest))
            return}
        let task = URLSession.shared.objectTask(for: request){ [weak self] (result: Result<TokenResponse,Error>) in
            guard let self = self else {return }
            switch result{
            case .success(let tokenBody):
                let token = tokenBody.authToken
                completion(.success(token))
            case .failure(let error):
                print("[fetchAuthToken]: AuthServiceError - \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
