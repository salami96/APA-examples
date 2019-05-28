//
//  DetalheViewController.swift
//  nanoChallenge2
//
//  Created by Gabriel Zanatto Salami on 23/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class DetalheViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ator: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var aniversario: UILabel!
    @IBOutlet weak var ocupacoes: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var apelido: UILabel!
    @IBOutlet weak var aparicoes: UILabel!
    var personagem = Personagem()
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: personagem.img)!
        
        let data = try? Data(contentsOf: url)
        
        if let imageData = data {
            image.image = UIImage(data: imageData)
        }
        ator.text = personagem.ator
        nome.text = personagem.nome
        aniversario.text = personagem.aniversario != "Unknown" ? personagem.aniversario : "Desconhecido"
        ocupacoes.text = format(array: personagem.ocupacao)
        status.text = personagem.status
        apelido.text = personagem.apelido
        aparicoes.text = format(array: personagem.aparicoes)
        // Do any additional setup after loading the view.
    }
    
    func format(array: [Any]) -> String{
        var text = ""
        if let data = array as? [Int]{
            for num in data{
                text += "Temporada \(num)"
                if num != data.last {
                    text += ", "
                }
            }
        } else {
            for item in array {
                text += "\(item)"
                if item as! String != array.last as! String {
                    text += ", "
                }
            }
        }
        return text
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
