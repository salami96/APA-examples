//
//  Person.swift
//  aula5
//
//  Created by Gabriel Zanatto Salami on 10/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import Foundation

// Representa uma pessoa genérica
struct Person {
    var name: String
    var age: Int
    
    func printPerson() {
        print("Name: /(name) e Age: /(age)")
    }
}
