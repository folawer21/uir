//
//  TaskViewContollerHelper.swift
//  uir
//
//  Created by Александр  Сухинин on 25.05.2024.
//
import Foundation
//TODO: добавить current task
//protocol TaskTypeProtocol {}

struct MarkOrCorrectTask:Codable{
    let id: Int
    let text: String
    let errorAmount: Int
    let hint: String
    
    enum CodingKeys: String,CodingKey{
        case id
        case text = "text_with_error"
        case errorAmount = "amount_error"
        case hint
    }
}
struct FillGapsTask:Codable{
    let id: Int
    let text: String
    let hint: String
    enum CodingKeys: String,CodingKey{
        case id
        case text = "text_with_error"
        case hint
    }
}
struct ChooseRightTask:Codable{
    let id: Int
    let task: String
    let answers: [String]
}

struct MatchBlocksTask:Codable{
    let id: Int
    let leftTable: [String]
    let rightTable: [String]
    enum CodingKeys: String,CodingKey{
        case id
        case leftTable = "left_table"
        case rightTable = "right_table"
    }
}
struct PhotoOrderTask:Codable{
    let id: Int
    let photosUrls: [String]
    enum CodingKeys: String,CodingKey{
        case id
        case photosUrls = "photos_urls"
      
    }
}

final class TaskViewControllerHelper{
    let storage = TasksStorage.shared
    let service = TasksService()
    weak var viewController: TaskViewController?
    
    func removeTask(){
        storage.removeLast()
    }
    func fetchNext(){
        guard let task = storage.getNext() else{
            viewController?.showWellDoneAlert()
            print("storage is empty")
            return
        }
        let id = task.id
        let taskType = task.taskType
        switch taskType{
        case "MarkOrCorrect":
            service.fetchUTZ(id: id, type: "MarkOrCorrect"){ [weak self] (result: Result<MarkOrCorrectTask,Error>) in
                guard let self = self else {
                    print("[TaskViewControllerHelper]: self is nil")
                    return}
                switch result{
                    case .success(let task):
                        self.viewController?.showMarkOrCorrectVC(data: task)
                case .failure(let error):
                    print("[TaskViewControllerHelper]: error")
                    return
                }
            }
        case "FillGaps":
            service.fetchUTZ(id: id, type: "FillGaps"){ [weak self] (result: Result<FillGapsTask,Error>) in
                guard let self = self else {
                    print("[TaskViewControllerHelper]: self is nil")
                    return}
                switch result{
                    case .success(let task):
                        self.viewController?.showFillGapsVC(data: task)
                case .failure(let error):
                    print("[TaskViewControllerHelper]: error")
                    return
                }
            }
        case "ChooseRight":
            service.fetchUTZ(id: id,type: "ChooseRight"){ [weak self] (result: Result<ChooseRightTask,Error>) in
                guard let self = self else {
                    print("[TaskViewControllerHelper]: self is nil")
                    return}
                switch result{
                    case .success(let task):
                        self.viewController?.showChooseRightVC(data: task)
                case .failure(let error):
                    print("[TaskViewControllerHelper]: error")
                    return
                }
            }
        case "MatchBlocks":
            service.fetchUTZ(id: id,type: "MatchBlocks"){ [weak self] (result: Result<MatchBlocksTask,Error>) in
                guard let self = self else {
                    print("[TaskViewControllerHelper]: self is nil")
                    return}
                switch result{
                    case .success(let task):
                        self.viewController?.showMatchBlocksVC(data: task)
                case .failure(let error):
                    print("[TaskViewControllerHelper]: error")
                    return
                }
            }
        case "PhotoOrder":
            service.fetchUTZ(id: id,type: "PhotoOrder"){ [weak self] (result: Result<PhotoOrderTask,Error>) in
                guard let self = self else {
                    print("[TaskViewControllerHelper]: self is nil")
                    return}
                switch result{
                    case .success(let task):
                        self.viewController?.showPhotoOrderVC(data: task)
                case .failure(let error):
                    print("[TaskViewControllerHelper]: error")
                    return
                }
            }
        default:
            print("Error: Undefined type")
            return
        }
       
    }
}
