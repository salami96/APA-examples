//
//  CellTableViewCell.swift
//  nanoChallenge2
//
//  Created by Gabriel Zanatto Salami on 23/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nome: UILabel!
    var id = Int()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
