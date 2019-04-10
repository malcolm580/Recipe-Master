//
//  BookSubViewController.swift
//  Recipe Master
//
//  Created by kwun yiu fung on 9/4/2019.
//  Copyright © 2019 kwun yiu fung. All rights reserved.
//

import UIKit

class BookSubViewController: UIViewController {
    
    
    @IBOutlet weak var testLabel: UILabel!
    
    var input = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        testLabel.text = input
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
