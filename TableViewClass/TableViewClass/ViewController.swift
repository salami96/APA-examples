//
//  ViewController.swift
//  TableViewClass
//
//  Created by Gabriel Zanatto Salami on 15/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

struct Person {
    var name: String
    var age: Int
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var people: [Person] =
        [
            Person(name: "Gabriel", age: 22),
            Person(name: "Nicole", age: 19),
            Person(name: "Odete", age: 56)
    ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { fatalError() }
        
        cell.nameLabel.text = people[indexPath.row].name
        cell.ageLabel.text = String(people[indexPath.row].age)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}

