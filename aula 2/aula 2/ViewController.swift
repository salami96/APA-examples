//
//  ViewController.swift
//  aula 2
//
//  Created by Gabriel Zanatto Salami on 07/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number = 0
    @IBOutlet weak var myNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        
    }
    @IBAction func buttonIncrement(_ sender: UIButton) {
        number = (number + 1);
        myNumber.text = String(number);
    }
    

}

