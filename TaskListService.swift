//
//  TaskListService.swift
//  uir
//
//  Created by Александр  Сухинин on 25.05.2024.
//

import UIKit

struct UTZListAnswer: Codable{
    let utzList: [UTZTask]
}

enum TaskListServiceError:Error {
    case invalidRequest
}
final class TaskListService{
    func makeUrlRequest(token: String) -> URLRequest?{
        guard let url = URL(string: Configuration.test.defaultBaseURL + "/api/utzlist") else {return nil}
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
        let task = URLSession.shared.objectTask(for: request){ [weak self] (result: Result<UTZListAnswer,Error>) in
            guard let self = self else {return }
            switch result{
            case .success(let tasksList):
                completion(.success(tasksList.utzList))
            case .failure(let error):
                completion(.failure(error))
            }
    
        }
        task.resume()
    }
}
