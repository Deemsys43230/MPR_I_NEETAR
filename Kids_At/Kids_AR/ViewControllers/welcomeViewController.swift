//
//  welcomeViewController.swift
//  Kids AR
//
//  Created by deemsys on 17/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import Firebase


class welcomeCell: UITableViewCell {
    @IBOutlet weak var productImage:UIImageView!
}

class welcomeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet var settingsButton: UIButton!
    
    @IBOutlet var contentList: UITableView!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        contentList.delegate = self
        contentList.dataSource = self
        
        contentList.tableFooterView = UIView()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.pausePlaying = false
        appDelegate.playSound() 
    }
    
    // TableView Delegates
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.view.frame.width == 320{
            return 200
        }
        else if UIDevice.current.model != "iPhone"{
            return 300
        }
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! welcomeCell
        
        
        switch indexPath.row {
        case 0:
            cell.productImage.image = #imageLiteral(resourceName: "alphabets_locked")
            let purchased = UserDefaults.standard.bool(forKey: delegate.productIDs[0])
            if purchased{
                cell.productImage.image = #imageLiteral(resourceName: "alphabets_unlocked")
            }
            break
        case 1:
            cell.productImage.image = #imageLiteral(resourceName: "animals_locked")
            let purchased = UserDefaults.standard.bool(forKey: delegate.productIDs[1])
            if purchased{
                cell.productImage.image = #imageLiteral(resourceName: "animals_unlocked")
            }
            break
        case 2:
            cell.productImage.image = #imageLiteral(resourceName: "fruits_locked")
            let purchased = UserDefaults.standard.bool(forKey: delegate.productIDs[0])
            if purchased{
                cell.productImage.image = #imageLiteral(resourceName: "fruits_unlocked")
            }
            break
        case 3:
            cell.productImage.image = #imageLiteral(resourceName: "puzzle")
            break
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Firebase event
        switch (indexPath.row) {
        case 0:
            Analytics.logEvent("Alphabets_Tapped_iOS", parameters: nil)
            break;
        case 1:
            Analytics.logEvent("Animals_Tapped_iOS", parameters: nil)
            break;
        case 2:
            Analytics.logEvent("Fruits_Tapped_iOS", parameters: nil)
            break;
        case 3:
            Analytics.logEvent("Puzzles_Tapped_iOS", parameters: nil)
            break;
        default:
            break;
        }
        
        
        if indexPath.row == 3{
            //puzzle
            let vc =  UIStoryboard.init(name: "puzzles", bundle: nil).instantiateViewController(withIdentifier: "puzzleList") as! puzzleList            
            self.navigationController?.pushViewController(vc, animated: true)
            return;
        }
        if indexPath.row == 1{
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.pausePlaying = true
            appDelegate.pauseSound()
            let vc =  UIStoryboard.init(name: "UnityStoryboard", bundle: nil).instantiateViewController(withIdentifier: "animalsAR") as! animalsAR
            vc.index = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
            return;
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.pausePlaying = true
        appDelegate.pauseSound()
        let vc =  UIStoryboard.init(name: "UnityStoryboard", bundle: nil).instantiateInitialViewController() as! augmentViewController
        vc.index = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.contentList.reloadData() 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.pausePlaying = false
        appDelegate.playSound()
        
    }
    
    
    @IBAction func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


