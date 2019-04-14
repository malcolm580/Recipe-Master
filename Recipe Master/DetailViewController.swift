//
//  DetailViewController.swift
//  GlidingCollectionDemo
//
//  Created by kwun yiu fung on 3/4/2019.
//  Copyright © 2019 Ramotion Inc. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailViewController: UIViewController {
    

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var detailTable: UITableView!
    @IBOutlet weak var topLabel: UILabel!
    
    var detail : [String]  = []
    
    var input: String = ""
    var jsonInput : JSON = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailTable.delegate = self
        detailTable.dataSource = self
        
        topLabel.text = jsonInput["Name"].stringValue
        
        coverImage.image = UIImage(named: jsonInput["Cover"].stringValue)
        
        for (_,subJson):(String, JSON)  in jsonInput["INGREDIENT"]{
            detail.append(subJson.stringValue)
        }
    }
    
    

}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detail.count
    }
    
    //retrun row cell base on section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = detail[indexPath.row]
        return cell
        
     
    }

    
    //set section header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ingredient"
    }

    
    
}
