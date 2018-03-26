//
//  sectionsViewController.swift
//  NEET AR 11 BIO PHASE 1
//
//  Created by deemsys on 15/03/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import UIKit

class sectionsViewController : UITableViewController{
    var sections:[[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        
        self.navigationController?.navigationItem.title = "Models"
    }
    
    //MARK:- TableView
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "content") as! tableCell
        
        cell.tag = indexPath.row
        
        var item = self.sections[indexPath.row]
        let visiblename = item["visiblename"] as! String
        cell.title.text = visiblename
        if visiblename == "Skeletal muscle"{
            cell.title.text = "Muscular tissue"
        }
        else if visiblename == "Simple squamous"{
            cell.title.text = "Epithelial tissue"
        }
        cell.profileimage.image = UIImage(named: item["modelimage"] as! String)
        
        cell.profileimage.layer.cornerRadius = 5
        cell.profileimage.layer.borderWidth = 1
        cell.profileimage.layer.borderColor = Constants.appTheme.cgColor
        
        return cell
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.sections.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = self.sections[indexPath.row]
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "QRScannerController") as! QRScannerController
        viewController.item = item
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
}
