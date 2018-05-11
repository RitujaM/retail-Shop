//
//  ProductsTableViewCell.swift
//  The Retail Shoppee
//
//  Created by Rituja Mahajan on 09/05/18.
//  Copyright © 2018 Rituja Mahajan. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_ProductName: UILabel!
    @IBOutlet weak var lbl_Price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
