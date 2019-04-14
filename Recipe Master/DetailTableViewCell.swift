//
//  DetailTableViewCell.swift
//  Recipe Master
//
//  Created by kwun yiu fung on 14/4/2019.
//  Copyright © 2019 kwun yiu fung. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var addItemToCartButton: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
