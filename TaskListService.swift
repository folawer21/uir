//
//  TaskListService.swift
//  uir
//
//  Created by Александр  Сухинин on 25.05.2024.
//

import UIKit
enum TaskListServiceError:Error {
    case invalidRequest
}
final class TaskListService{
    func makeUrlRequest(token: String) -> URLRequest?{
        guard let url = URL(string: "http://79.174.80.180:7000") else {return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return urlRequest
    }
    
    func fetchTaskList(token: String,completion: @escaping(Result<[UTZTask],Error>) -> Void){
        guard let request = makeUrlRequest(token: token) else {
            print("[fetchTaskList]: TaskListServiceError - invalidRequest")
            completion(.failure(TaskListServiceError.invalidRequest))
            return }
        let task = URLSession.shared.objectTask(for: request){ [weak self] (result: Result<[UTZTask],Error>) in
            guard let self = self else {return }
            switch result{
            case .success(let tasksList):
                completion(.success(tasksList))
            case .failure(let error):
                completion(.failure(error))
            }
    
        }
        task.resume()
    }
}
