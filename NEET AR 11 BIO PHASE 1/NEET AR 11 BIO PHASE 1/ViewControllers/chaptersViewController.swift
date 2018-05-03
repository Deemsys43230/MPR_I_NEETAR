//
//  chaptersViewController.swift
//  NEET AR 11 BIO PHASE 1
//
//  Created by deemsys on 15/03/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import UIKit

class chaptersViewController : UITableViewController{
    var chapters:[[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "isViewFromChapters")
        UserDefaults.standard.synchronize()
//        self.tableView.rowHeight = UITableViewAutomaticDimension;
//        self.tableView.estimatedRowHeight = 54.0;
        loadJSONFile()
        self.tableView.tableFooterView = UIView()
    }
    func loadJSONFile(){
        if let path = Bundle.main.path(forResource: "3dmodels", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [[String : Any]]{
                    self.chapters = jsonResult
                    self.tableView.reloadData()
                }
                
                
            } catch {
                // handle error
                print("Error")
            }
        }
      
    }
    //MARK:- TableView
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < self.chapters.count {
            
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "content") as! tableCell
            
            cell.tag = indexPath.row
            
            var item = self.chapters[indexPath.row]
            
            cell.title.text = item["name"] as! String
            
            
            return cell
        }
        else if indexPath.row == self.chapters.count {
            
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "staticcontent") as! tableCell
            
            cell.tag = indexPath.row
            cell.title.text = "GET NEET AR 11th Biology PHASE I"
            
            return cell
        }
        else if indexPath.row == self.chapters.count + 1 {
            
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "staticcontent") as! tableCell
            
            cell.tag = indexPath.row
            cell.title.text = "GET NEET AR 11th Biology PHASE III"
            
            return cell
        }
        else {
            
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "staticcontent") as! tableCell
            
            cell.tag = indexPath.row
            cell.title.text = "GET NEET AR 11th Biology PHASE IV"
            
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.chapters.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < self.chapters.count {
            let item = self.chapters[indexPath.row]["models"] as! [[String:Any]]
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "sectionsViewController") as! sectionsViewController
            viewController.sections = item
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        else if indexPath.row == self.chapters.count {
            self.openurlwith(appStoreLink: Constants.phase1)
        }
        else if indexPath.row == self.chapters.count + 1 {
            self.openurlwith(appStoreLink: Constants.phase3)
        }
        else {
            self.openurlwith(appStoreLink: Constants.phase4)
        }
        
    }
    
    func openurlwith(appStoreLink:String){
        
        /* First create a URL, then check whether there is an installed app that can
         open it on the device. */
        if let url = URL(string: appStoreLink), UIApplication.shared.canOpenURL(url) {
            // Attempt to open the URL.
            UIApplication.shared.open(url, options: [:], completionHandler: {(success: Bool) in
                if success {
                    print("Launching \(url) was successful")
                }})
        }
    }
  
    
   
}
