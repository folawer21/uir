//
//  TasksStorage.swift
//  uir
//
//  Created by Александр  Сухинин on 25.05.2024.
//

import Foundation
struct UTZList: Codable{
    let utzList: [UTZList]
}
struct UTZTask:Codable{
    let id: Int
    let taskType: String
}
final class TasksStorage{
    private static var _tasks : [UTZTask] = []
    var tasks: [UTZTask]{
        get{
            return TasksStorage._tasks
        }
        set {
            TasksStorage._tasks = newValue
        }
    }
    
    func setTasks(tasks: [UTZTask]){
        TasksStorage._tasks = tasks
    }
    func getNext() -> UTZTask?{
        return TasksStorage._tasks.last
    }
    func removeLast(){
        TasksStorage._tasks.removeLast()
    }
    private init(){
        tasks = []
    }
    static let shared = TasksStorage()
}
