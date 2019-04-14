//
//  BookSubViewController.swift
//  Recipe Master
//
//  Created by kwun yiu fung on 9/4/2019.
//  Copyright © 2019 kwun yiu fung. All rights reserved.
//

import UIKit
import SwiftyJSON

class BookSubViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var topLabel: UILabel!
    
    var jsonInput : JSON = ""
    
    var stepNumber : Int  = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        topLabel.text = "Step \(stepNumber+1)"
        image.image = UIImage(named: jsonInput["Image"].stringValue)
        textView.text = jsonInput["Description"].stringValue
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
