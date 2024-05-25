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
    
    private func makeUTZUrlRequest(id: Int,type: String) -> URLRequest?{
        //TODO: Обработать добавление id в ссылку или куда
        guard let url = URL(string: Configuration.test.defaultBaseURL + "/api/\(type)") else {return nil}
        print(url)
        var urlRequest = URLRequest(url: url)
        let userData = ["id" : id]
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: userData, options: [])
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("Bearer \(tokenStorage.token)", forHTTPHeaderField: "Authorization")
            urlRequest.httpBody = jsonData
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            return urlRequest
        }catch{
            print("Error converting data to JSON: \(error)")
            return nil
        }
    }
    
    func fetchUTZ<T: Codable>(id: Int,type:String,completion: @escaping(Result<T,Error>) -> Void){
        guard let urlRequest = makeUTZUrlRequest(id: id,type: type) else {
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
