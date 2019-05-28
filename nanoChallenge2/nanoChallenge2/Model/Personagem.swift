//
//  Personagem.swift
//  nanoChallenge2
//
//  Created by Gabriel Zanatto Salami on 23/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import Foundation

class Personagem{
    var id: Int
    var nome: String
    var aniversario: String
    var ocupacao: [String]
    var img: String
    var status: String
    var apelido: String
    var aparicoes: [Int]
    var ator: String
    
    init(id: Int, nome: String, aniver: String, ocupacao: [String], img: String, status: String, apelido: String, aparicoes: [Int], ator: String) {
        self.id = id
        self.nome = nome
        self.aniversario = aniver
        self.ocupacao = ocupacao
        self.img = img
        self.status = status
        self.apelido = apelido
        self.aparicoes = aparicoes
        self.ator = ator
    }
    init(){
        self.id = 0
        self.nome = ""
        self.aniversario = ""
        self.ocupacao = []
        self.img = ""
        self.status = ""
        self.apelido = ""
        self.aparicoes = []
        self.ator = ""
    }
}

