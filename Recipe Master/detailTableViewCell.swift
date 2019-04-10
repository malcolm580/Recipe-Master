//
//  detailTableViewCell.swift
//  Recipe Master
//
//  Created by kwun yiu fung on 7/4/2019.
//  Copyright © 2019 kwun yiu fung. All rights reserved.
//

import UIKit

class detailTableViewCell: UITableViewCell {


    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellText: UITextField!
    
    var inputImageName: String = ""
    var inputText : String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellText!.text = inputText
        cellImage!.image = UIImage(named: inputImageName)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
