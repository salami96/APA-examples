//
//  ViewController.swift
//  challenge6
//
//  Created by Gabriel Zanatto Salami on 21/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tasks = loadTasks(tasks: tasks)
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new Task", message: "", preferredStyle: .alert)
        alert.addTextField { textfield in
            textfield.placeholder = "Type a name for your task..."
        }
        alert.addAction(UIAlertAction(title: "ADD", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction) in
            if let text = alert.textFields?.first {
                if text.text != "" && text.text != nil {
                    self.createTask(taskName: (text.text)!)
                    self.tasks = self.loadTasks(tasks: self.tasks)
                    self.tableView.reloadData()
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel!.text =
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: tasks[indexPath.row].name!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        if tasks[indexPath.row].done{
            cell.textLabel?.attributedText = attributeString
        } else {
            cell.textLabel?.text = tasks[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setDone(task: tasks[indexPath.row])
        tasks = loadTasks(tasks: tasks)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            removeTask(task: tasks[indexPath.row])
            tasks = loadTasks(tasks: tasks)
            tableView.reloadData()
        }
    }

}
