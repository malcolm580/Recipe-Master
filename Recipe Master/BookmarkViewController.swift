//
//  BookmarkViewController.swift
//  Recipe Master
//
//  Created by kwun yiu fung on 14/4/2019.
//  Copyright © 2019 kwun yiu fung. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    
    @IBOutlet weak var image1: UIImageView!
    
    
    @IBOutlet weak var image2: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Bookmark"
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe1))
        image1.addGestureRecognizer(tap1)
        image1.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe1))
        image2.addGestureRecognizer(tap2)
        image2.isUserInteractionEnabled = true
    }
    
    @objc func tappedMe1()
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyBoard.instantiateViewController(withIdentifier: "pageView") as? PageViewController {
            
            controller.input = "japan1"
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    @objc func tappedMe2()
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyBoard.instantiateViewController(withIdentifier: "pageView") as? PageViewController {
            
            controller.input = "american1"
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

}
