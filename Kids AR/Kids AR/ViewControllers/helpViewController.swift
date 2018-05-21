//
//  helpViewController.swift
//  Kids AR
//
//  Created by deemsys on 19/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit


class helpViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var contentList: UITableView!
    
    
    override func viewDidLoad() {
        
        
        contentList.delegate = self
        contentList.dataSource = self
        
        contentList.tableFooterView = UIView()
        
//     contentList.rowHeight = UITableViewAutomaticDimension;
//       contentList.estimatedRowHeight = 50.0;
        
    }
  
    
    @IBAction func backAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // TableView Delegates
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.helpArray.count;
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        // Content row
        let cell:tableCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as! tableCell?)!
        cell.title.text = Constants.helpArray[indexPath.row]
        // add border and color
        cell.backgroundColor = UIColor.clear
        
        
        return cell
        
    }
    
    
    
    
}


