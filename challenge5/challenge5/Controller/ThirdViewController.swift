//
//  ThirdViewController.swift
//  challenge5
//
//  Created by Gabriel Zanatto Salami on 14/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var data : (Data, String)? = nil
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var modo: UILabel!
    @IBOutlet weak var musica: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        email.text = data?.0.email
        modo.text = data?.0.modo
        musica.text = data?.1
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
