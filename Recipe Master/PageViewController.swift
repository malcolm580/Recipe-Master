//
//  PageViewController.swift
//  Recipe Master
//
//  Created by kwun yiu fung on 9/4/2019.
//  Copyright © 2019 kwun yiu fung. All rights reserved.
//

import UIKit
import SwiftyJSON

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var input = ""

    lazy var subViewControllers:[UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = self;
        self.dataSource = self;
        
        //generate subView and to subView array
        
        subViewGenerate()
        setViewControllers([subViewControllers[0]], direction: .forward , animated: true, completion: nil)
        
        //add navigation bar button
        let favoriteButton = UIBarButtonItem(barButtonSystemItem: .bookmarks , target: self, action: #selector(tagItem))
        self.navigationItem.rightBarButtonItem = favoriteButton
        self.toolbarItems = [favoriteButton]
    }
    
    func subViewGenerate() {
        
        //JSON
        guard let path = Bundle.main.path(forResource: input, ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
           
            let json = try JSON(data: data)
            
            let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Detail") as! DetailViewController
            
            view.jsonInput = json["FirstPage"]
            
            
            subViewControllers.append(view)
            
            var i = 0
            
            for (_,subJson):(String, JSON) in json["Steps"]{
                
                let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "bookSubView") as! BookSubViewController
                
                view.stepNumber = i
                
                view.jsonInput = subJson
                
                subViewControllers.append(view)
                
                i = i + 1
                
            }
           
        }
        catch {
            print(error)
        }
        
        
    }
    
    @objc func tagItem(){
        let alert = UIAlertController(title: "Bookmark", message: "You have add this receipt into Bookmark", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Confirm", style: .cancel, handler: nil))
        
        self.present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                guard self?.presentedViewController == alert else { return }
                
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init( transitionStyle: .pageCurl , navigationOrientation: .horizontal , options: nil )
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        
        if currentIndex <= 0
        {
            return nil
        }
        
        return subViewControllers[currentIndex-1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.index(of : viewController) ?? 0
        
        if currentIndex >= (subViewControllers.count - 1){
            return nil
        }
        
        return subViewControllers[currentIndex + 1]
        
    }
    
    
}
