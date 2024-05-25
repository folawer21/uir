//
//  TasksStorage.swift
//  uir
//
//  Created by Александр  Сухинин on 25.05.2024.
//

import Foundation
struct UTZTask{
    let id: Int
    let taskType: String
}
final class TasksStorage{
    private (set) var tasks : [UTZTask]
    func setTasks(tasks: [UTZTask]){
        self.tasks = tasks
    }
    func getNext() -> UTZTask?{
        return tasks.last
    }
    func removeLast(){
        tasks.removeLast()
    }
    init(){
        tasks = []
    }
}
