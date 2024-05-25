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
    
}
struct FillGapsTask:Codable{
    
}
struct ChooseRightTask:Codable{
    
}
struct MatchBlocksTask:Codable{
    
}
struct PhotoOrderTask:Codable{
    
}

final class TaskViewControllerHelper{
    let storage = TasksStorage.shared
    let service = TasksService()
    weak var viewController: TaskViewController?
    func buttonTapped(){
        guard let task = storage.getNext() else{
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
