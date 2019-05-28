//
//  ViewController.swift
//  Challenge1
//
//  Created by Gabriel Zanatto Salami on 07/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bg: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    let spider = UIImage(named: "spider");
    let doente = UIImage(named: "doente");
    let green = #colorLiteral(red: 0.02717729099, green: 0.2972089648, blue: 0.03178380057, alpha: 1);
    let red = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1);
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func realidade(_ sender: UIButton) {
        let test = (label.text == "REALIDADE");
        bg.backgroundColor = test ? green: red;
        button.setTitle(test ? "Ver Realidade" : "Ver Expectativa", for: .normal);
        button.setTitleColor(test ? green : red, for: .normal);
        imgView.image = test ? spider : doente;
        label.text = test ? "EXPECTATIVA" : "REALIDADE";
    }
}

