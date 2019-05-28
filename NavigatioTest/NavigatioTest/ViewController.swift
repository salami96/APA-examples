//
//  ViewController.swift
//  NavigatioTest
//
//  Created by Gabriel Zanatto Salami on 14/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sendColor(_ sender: UIButton) {
        performSegue(withIdentifier: "nextScreen", sender: sender.backgroundColor)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextScreenVC = segue.destination as? ViewControllerBlueScreen, let color = sender as? UIColor {
            nextScreenVC.backgroundColor = color
            
        }
    }
    

}

