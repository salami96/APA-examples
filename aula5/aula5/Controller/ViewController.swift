//
//  ViewController.swift
//  aula5
//
//  Created by Gabriel Zanatto Salami on 10/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var person = Person(name: "Gabriel", age: 22)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = person.name
        ageLabel.text = String(person.age)
        print("view carregou");
        view.backgroundColor = .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        view.backgroundColor = .green
        print("view vai aparecer")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view apareceu")
        view.backgroundColor = .red
    }

}

