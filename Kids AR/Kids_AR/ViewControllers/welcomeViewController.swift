//
//  welcomeViewController.swift
//  Kids AR
//
//  Created by deemsys on 17/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit


class welcomeViewController: UIViewController, CRPageViewControllerDataSource {
    
    
    
@IBOutlet var settingsButton: UIButton!
    
    var pageViewController:CRPageViewController!
    var sourse:[CRChildViewController]!
    var viewControllersNumber:NSNumber!
    var    curentVC:CRChildViewController!
    
    
    override func viewDidLoad() {
       
        settingsButton.layer.cornerRadius = 5;
        settingsButton.clipsToBounds = true;
        
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
 
    }
   
    
       @IBAction func settingsAction(sender: UIButton) {
    
        
    }
    @IBAction func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func pageViewController(_ pageViewController: CRPageViewController!, viewControllerAfter viewController: UIViewController!) -> UIViewController! {
        
        var i =  self.sourse.index(of: viewController as! CRChildViewController)! + 1
        
        if (i >= self.sourse.count) {
            i = 0;
        }
        return self.sourse[i];
    }
    
    func pageViewController(_ pageViewController: CRPageViewController!, viewControllerBefore viewController: UIViewController!) -> UIViewController! {
        var i =  self.sourse.index(of: viewController as! CRChildViewController)! - 1
        if (i < 0) {
            i = self.sourse.count - 1;
        }
        return self.sourse[i];
    }
    func createViewControllerWithNumber(number:Float)->CRChildViewController{
      let vc =  self.storyboard?.instantiateViewController(withIdentifier: "childVC") as! CRChildViewController
        vc.sourse = []
        return vc
    }
  
    
   
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != "CRPageViewControllerSegue"{
            return
        }
        
            self.pageViewController = CRPageViewController()
            self.sourse = []
            self.viewControllersNumber = 4;
        
        for i in 0..<4 {
            self.sourse.append(createViewControllerWithNumber(number: Float(i)))
            
            }
        self.pageViewController = segue.destination as! CRPageViewController;
        self.pageViewController.countPageInController = self.viewControllersNumber as! Int;
            self.pageViewController.childVCSize = CGSize(width: 250, height: 500)
            self.pageViewController.sizeBetweenVC = 10;
        self.pageViewController.offsetOfHeightCentralVC = 0;
            self.pageViewController.animationSpeed = 0.5;
            self.pageViewController.animation = .easeInOut;
            self.pageViewController.viewControllers = []
            self.pageViewController.dataSource = self;
        
            
        
    }
    
}
