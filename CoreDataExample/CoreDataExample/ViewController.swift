//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Gabriel Zanatto Salami on 21/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var tvShows: [TVShow] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadFromDataStorage()
        // Do any additional setup after loading the view.
    }
    
    func saveNewTvShow(tvShowName: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let tvShow = TVShow(context: context)
            tvShow.name = tvShowName
            tvShows.append(tvShow)
            textField.text = ""
            tableView.reloadData()
            
            do {
                try context.save()
            } catch let error {
                print("Ocorreu um erro \(error)")
            }
        }
    }
    
    func loadFromDataStorage() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let request: NSFetchRequest  = TVShow.fetchRequest()
            do {
                tvShows = try context.fetch(request)
            } catch let error {
                print("Ocorreu um erro: \(error)")
            }
        }
    }

    @IBAction func didTapButton(_ sender: Any) {
        if let text = textField.text{
            saveNewTvShow(tvShowName: text)
        }
    }
    
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = tvShows[indexPath.row].name
        return cell
    }
}

