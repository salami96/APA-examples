//
//  SecondViewController.swift
//  challenge5
//
//  Created by Gabriel Zanatto Salami on 14/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var musicas = Array<String>()
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var selected: UILabel!
    var data: Data? = nil
    var resultado: String = ""
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttons{
            button.layer.cornerRadius = 20
        }

    }

    func reload(){
        resultado = ""
        for musica in musicas{
            resultado += musica + ", "
        }
        selected.text = resultado
        
    }
    @IBAction func indie(_ sender: UIButton) {
        musicas.append("Indie")
        reload()
    }
    @IBAction func funk(_ sender: UIButton) {
        musicas.append("Funk")
        reload()
    }
    @IBAction func oitente(_ sender: UIButton) {
        musicas.append("80's")
        reload()
    }
    @IBAction func rock(_ sender: UIButton) {
        musicas.append("Rock")
        reload()
    }
    @IBAction func add(_ sender: UIButton) {
        if field.text != ""{
            musicas.append(field.text!)
        }
        field.text = ""
        reload()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextScreenVC = segue.destination as? ThirdViewController, let newData = sender as? (Data, String) {
            nextScreenVC.data = newData
        }
    }
    
    @IBAction func nextPage(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toResume", sender: (data, resultado))
    }
    
}
