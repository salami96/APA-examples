//
//  ViewController.swift
//  challenge5
//
//  Created by Gabriel Zanatto Salami on 14/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data = Array<Data>()
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var google: UIButton!
    @IBOutlet weak var fb: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data.append(Data(email: "people@email.com", modo: "Login com email"))
        data.append(Data(email: "people@facebook.com", modo: "Login com facebook"))
        data.append(Data(email: "people@gmail.com", modo: "Login com google+"))
        email.layer.cornerRadius = 20
        fb.layer.cornerRadius = 20
        google.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextScreenVC = segue.destination as? SecondViewController, let data = sender as? Data {
            nextScreenVC.data = data
        }
    }

    @IBAction func login(_ sender: UIButton) {
        if sender == email {
            performSegue(withIdentifier: "toMusicas", sender: data[0])
        }
        if sender == fb {
            performSegue(withIdentifier: "toMusicas", sender: data[1])
        }
        if sender == google {
            performSegue(withIdentifier: "toMusicas", sender: data[2])
        }
    }
    
}

