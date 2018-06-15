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
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.helpArray.count;
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            if indexPath.row == 8{
                
                // Content row
                let cell:tableCell = (tableView.dequeueReusableCell(withIdentifier: "titlecell") as! tableCell?)!
                cell.title.text = "How to use 3d models?"
                // add border and color
                cell.backgroundColor = UIColor.clear
                return cell
            }
        if indexPath.row == Constants.helpArray.count - 1{
            let cell:tableCell = (tableView.dequeueReusableCell(withIdentifier: "happycell") as! tableCell?)!
            
            cell.title.text = Constants.helpArray[indexPath.row]
            // add border and color
            cell.backgroundColor = UIColor.clear
            return cell
        }
            let cell:tableCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as! tableCell?)!
            cell.title.text = Constants.helpArray[indexPath.row]
        cell.title.setLineSpacing()
            // add border and color
            cell.backgroundColor = UIColor.clear
            return cell
         
    }
    
    
    
    
}

extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 1.5, lineHeightMultiple: CGFloat = 1.3) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
