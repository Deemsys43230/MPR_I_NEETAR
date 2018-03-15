//
//  helpViewController.swift
//  NEET AR 11 BIO PHASE 1
//
//  Created by deemsys on 15/03/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import Foundation

class helpViewController:UITableViewController{
    
    var hintsTxt:[String] = []
    var isViewFromChapters:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.isViewFromChapters =  UserDefaults.standard.value(forKey: "isViewFromChapters") as! Bool
   
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = Constants.appTheme
        var navbarFont = UIFont.systemFont(ofSize: 17)
        var barbuttonFont = UIFont.systemFont(ofSize: 15)
        if let font = UIFont(name: Constants.FontName.SemiBold.rawValue, size: 19) {
            navbarFont = font
            barbuttonFont = UIFont(name: Constants.FontName.Regular.rawValue, size: 15) ?? UIFont.systemFont(ofSize: 15)
        }
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: navbarFont, NSAttributedStringKey.foregroundColor:UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: barbuttonFont, NSAttributedStringKey.foregroundColor:UIColor.white], for: UIControlState.normal)
        self.navigationController?.navigationBar.isTranslucent = true
        self.tableView.tableFooterView = UIView()
        self.loadHints()
    }
    
    @IBAction func exitFrom(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 
   
    
    func loadHints(){
      if  isViewFromChapters == true{ 
        
        self.hintsTxt = [
            " 1. Select a chapter from the list",
            " 2. You will navigate to the models list. Choose the model to augment",
            " 3. Wait until application loads camera view. Scan QR code of an object",
            " 4. Augment 3d model using camera",
            " 5. Use ⚙ button to change 3D model settings",
            " 6. Use ↻ button to clear models",
            " 7. Use 🏠 button to go to Chapters",
            " 8. For instructions use help button"
                        ]
        }
      else{
        self.hintsTxt = [
            "1. Set Place on air to ON to display object on Air",
            "2. Set Place on air to OFF to display object on Plane",
            "3. Set Show Parts to ON to display parts of model",
            "4. Set Show Parts to OFF to display model",
            "5. Use Scale to set object's zoom size",
            "6. Use Zoom option to Enable/Disable pinch and zoom of object"
        ]
        }
    }
    //MARK:- TableView
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "content") as! tableCell
        
        cell.tag = indexPath.row
        
       
        cell.title.text = self.hintsTxt[indexPath.row]
        
        
        return cell
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.hintsTxt.count
    }
   
    
    
    
}
