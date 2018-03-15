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
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "content") as! tableCell
        
        cell.tag = indexPath.row
        
        var item = self.chapters[indexPath.row]
        
        cell.title.text = item["name"] as! String
        
        
        return cell
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
        
        let item = self.chapters[indexPath.row]["models"] as! [[String:Any]]
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "sectionsViewController") as! sectionsViewController
        viewController.sections = item
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
  
    
   
}
