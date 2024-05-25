//
//  TaskService.swift
//  uir
//
//  Created by Александр  Сухинин on 25.05.2024.
//

import UIKit

enum TasksServiceError:Error {
    case invalidRequest
}

final class TasksService{
    private let configuration = Configuration.test
    private let tokenStorage = TokenStorage()
    
    private func makeUTZUrlRequest(id: Int) -> URLRequest?{
        //TODO: Обработать добавление id в ссылку или куда
        guard let url = URL(string: "http://79.174.80.180:7000") else {return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(tokenStorage.token)", forHTTPHeaderField: "Authorization")
        return urlRequest
    }
    
    func fetchUTZ<T: Codable>(id: Int,completion: @escaping(Result<T,Error>) -> Void){
        guard let urlRequest = makeUTZUrlRequest(id: id) else {
            print("[fetchUTZ]: TaskServiceError - invalidRequest")
            completion(.failure(TasksServiceError.invalidRequest))
            return
        }
        let task = URLSession.shared.objectTask(for: urlRequest){ [weak self] (result: Result<T,Error>) in
            guard let self = self else {return}
            switch result{
            case .success(let taskResult):
                completion(.success(taskResult))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
