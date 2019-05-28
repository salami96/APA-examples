//
//  Message.swift
//  challenge4
//
//  Created by Gabriel Zanatto Salami on 10/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import Foundation

struct Message{
    var to: String
    var subject: String
    var phone: String
    var body: String
    func printMessage() -> String{
        
        return """
        Email: \(to), Assunto: \(subject), Telefone: \(phone)
        Corpo: \(body)
        """
    }
}
