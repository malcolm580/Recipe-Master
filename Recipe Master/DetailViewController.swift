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
    
    
    var arr1 = ["A1", "A2"]
    var arr2 = ["B1" , "B2","B3" ,"B4" ,"B4","B8","B6" ]

    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var detailTable: UITableView!
    
    var input: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailTable.delegate = self
        detailTable.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.title = input
        self.coverImage.image = UIImage(named: "japan1")
        
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

extension DetailViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arr1.count
        case 1:
            return arr2.count
        default:
            return 0
        }
    }
    
    //retrun row cell base on section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
            cell.textLabel?.text = arr1[indexPath.row]
           
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier : "cell", for: indexPath) as? detailTableViewCell
            cell!.inputImageName = "japan1"
            cell!.inputText = arr2[indexPath.row]
            return cell!
        }
        
     
    }

    
    //set section header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "A"
        case 1:
            return "B"
        default:
            return "A"
        }
    }
    
    //set row height based on section
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 50
        default:
            return 80
        }
    }
    
    
}
