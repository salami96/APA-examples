//
//  Persistence.swift
//  challenge6
//
//  Created by Gabriel Zanatto Salami on 21/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    func createTask(taskName: String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let task = Task(context: context)
            task.name = taskName
            do {
                try context.save()
            } catch let error {
                print("Ocorreu um erro \(error)")
            }
        }
    }
    func loadTasks(tasks: [Task]) -> [Task]{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let request: NSFetchRequest  = Task.fetchRequest()
            do {
                return try context.fetch(request)
            } catch let error {
                print("Ocorreu um erro: \(error)")
            }
        }
        return tasks
    }
    func setDone(task: Task){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            task.done = !task.done
            do {
                try context.save()
            } catch let error {
                print("Ocorreu um erro \(error)")
            }
        }
    }
    func removeTask(task: Task){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            context.delete(task)
            do {
                try context.save()
            } catch let error {
                print("Ocorreu um erro \(error)")
            }
        }
    }
}
