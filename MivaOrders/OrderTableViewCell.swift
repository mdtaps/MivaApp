//
//  OrderTableViewCell.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/10/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var orderFirstName: UILabel!
    @IBOutlet weak var orderLastName: UILabel!
    @IBOutlet weak var orderAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
