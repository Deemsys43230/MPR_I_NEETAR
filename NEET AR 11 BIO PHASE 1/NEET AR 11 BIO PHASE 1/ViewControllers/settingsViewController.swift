//
//  settingsVC.swift
//  NEET AR 11 BIO PHASE 1
//
//  Created by deemsys on 15/03/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import UIKit

class settingsVC : UITableViewController{
    
    @IBOutlet var switchtoplace: UISwitch!
    @IBOutlet var slidervalue: UILabel!
    @IBOutlet var sliderval: UISlider!
    @IBOutlet var switchtozoom: UISwitch!
    @IBOutlet var showParts: UISwitch!
    var currentmodel:model!
    var canmodify:Bool!
    
    override func viewDidLoad() {
        self.tableView.tableFooterView = UIView()
        
        let val = UserDefaults.standard.value(forKey: "isSurfaceEnabled") as! Bool
        
        self.switchtoplace.isOn =  !val
        var scalepoint = UserDefaults.standard.value(forKey: "scaleValue") as! Float
        self.slidervalue.text = "\(scalepoint)"
        
        scalepoint = scalepoint/0.1
        self.sliderval.value =   scalepoint
        
        let partsVal = UserDefaults.standard.value(forKey: "showParts") as! Bool
        
        self.showParts.isOn = partsVal
        
        canmodify = UserDefaults.standard.value(forKey: "canModifySurface") as! Bool
        
        self.switchtozoom.isOn  =  UserDefaults.standard.value(forKey: "shouldZoom")  as! Bool
    }
    
    @IBAction func placeonairaction(_ sender: UISwitch) {
        UserDefaults.standard.set(!sender.isOn, forKey: "isSurfaceEnabled")
        UserDefaults.standard.synchronize()
    }
    @IBAction func scaleaction(_ sender: UISlider) {
        let val = round(sender.value)*0.1
        
        self.slidervalue.text =  "\(val)"
        
        UserDefaults.standard.set(val, forKey: "scaleValue")
        UserDefaults.standard.synchronize()
    }
    @IBAction func enablezoomaction(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "shouldZoom")
        UserDefaults.standard.synchronize()
    }
    @IBAction func showPartsAction(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "showParts")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func showHintsPage(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isViewFromChapters")
        UserDefaults.standard.synchronize()
        self.present((self.storyboard?.instantiateViewController(withIdentifier: "secondaryNAV"))!, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && canmodify == false{
            let cell =  super.tableView(tableView, cellForRowAt: indexPath)
            cell.isUserInteractionEnabled = false
            cell.contentView.alpha = 0.5
        }
        else if indexPath.row == 1 && UserDefaults.standard.value(forKey: "canshowParts") as! Bool == false{
            let cell =  super.tableView(tableView, cellForRowAt: indexPath)
            cell.isUserInteractionEnabled = false
            cell.contentView.alpha = 0.5
        }
        
        return  super.tableView(tableView, cellForRowAt: indexPath)
    }
    
}

