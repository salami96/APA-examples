//
//  ViewController.swift
//  nanoChallenge2
//
//  Created by Gabriel Zanatto Salami on 23/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var personagens = [Personagem]()
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        
        guard let url = URL(string: "https://breakingbadapi.com/api/characters/") else { return }
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    for pessoa in json ?? [] {
                        self.personagens.append(Personagem(id: pessoa["char_id"] as! Int, nome: pessoa["name"] as! String, aniver: pessoa["birthday"] as! String, ocupacao: pessoa["occupation"] as! [String], img: pessoa["img"] as! String, status: pessoa["status"] as! String, apelido: pessoa["nickname"] as! String, aparicoes: pessoa["appearance"] as! [Int], ator: pessoa["portrayed"] as! String ))
                    }
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                } catch let erro {
                    print(erro.localizedDescription)
                }
            }
        })
        task.resume()
        
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: personagens[indexPath.row])
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextScreenVC = segue.destination as? DetalheViewController, let data = sender as? Personagem {
            nextScreenVC.personagem = data
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell else { fatalError() }
        
        
        
        cell.nome.text = personagens[indexPath.row].nome
        cell.id = personagens[indexPath.row].id
        
        let url = URL(string: personagens[indexPath.row].img)!
        
        let data = try? Data(contentsOf: url)
        
        if let imageData = data {
            cell.img.image = UIImage(data: imageData)
        }
        
        return cell
    }
    
    
}
