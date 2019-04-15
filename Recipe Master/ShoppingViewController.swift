//
//  ShoppingViewController.swift
//  Recipe Master
//
//  Created by Ho Man Chong on 15/4/2019.
//  Copyright © 2019 kwun yiu fung. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var shoppingTable: UITableView!
    
    var detail : [String]  = ["1 lb Chicken wings (flats/drumettes) (454 g)", "¼ tsp salt", "Freshly ground black pepper", "1 Tbsp extra virgin olive oil", "1 stalk celery", "2 cloves garlic", "1 bay leaf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingTable.delegate = self
        shoppingTable.dataSource = self

        // Do any additional setup after loading the view.
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

extension ShoppingViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detail.count
    }
    
    //retrun row cell base on section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
                cell.textLabel?.text = detail[indexPath.row]
                cell.textLabel?.font.withSize(20)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! DetailTableViewCell
//        cell.detailText?.text = detail[indexPath.row]
//        cell.detailText?.font.withSize(20)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ingredient"
    }
    
}

