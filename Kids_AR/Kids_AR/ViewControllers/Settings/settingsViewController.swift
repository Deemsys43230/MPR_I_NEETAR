//
//  settingsViewController.swift
//  Kids AR
//
//  Created by deemsys on 21/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit


class settingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
   
    
    @IBOutlet var contentList: UITableView!
    
    var alertController:UIAlertController!
    
    
    override func viewDidLoad() {

        
        contentList.delegate = self
        contentList.dataSource = self
        
        contentList.tableFooterView = UIView()
        self.prepareAlert()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    @IBAction func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // TableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row%2 != 0{
            //print(UIDevice.current.model)
            if UIDevice.current.model == "iPhone"{
            return 45;
            }
            return 55
        }
        else if indexPath.row == 0 || indexPath.row == 8{
            if UIDevice.current.model == "iPhone"{
                return 40;
            }
            return 50
        }
        if UIDevice.current.model == "iPhone"{
            return 20;
        }
        return 30
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row%2 != 0 {
            
            // Content row
            let cell:tableCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as! tableCell?)!
       
            switch indexPath.row{
                
            case 1:
                cell.title.text = "Music"
                let music = UserDefaults.standard.value(forKey: "isMusicOn") as! Bool
                cell.musicON.isOn = music
                
                cell.musicON.isHidden = false
                cell.subTitle.isHidden = true
                break;
            case 3:
                cell.title.text = "Purchase"
                cell.musicON.isHidden = true
                cell.subTitle.isHidden = true
                break;
            case 5:
                cell.title.text = "Rate us"
                cell.musicON.isHidden = true
                cell.subTitle.isHidden = true
                break;
            case 7:
                cell.title.text = "Name"
                cell.subTitle.text = UserDefaults.standard.value(forKey: "KidName") as! String
                cell.musicON.isHidden = true
                cell.subTitle.isHidden = false
                break;
            case 9:
                cell.title.text = "Help"
                cell.musicON.isHidden = true
                cell.subTitle.isHidden = true
                break;
            case 11:
                cell.title.text = "Contact"
                cell.musicON.isHidden = true
                cell.subTitle.isHidden = true
                break;
            case 13:
                cell.title.text = "Privacy"
                cell.musicON.isHidden = true
                cell.subTitle.isHidden = true
                break;
                
            default:
                break;
            }
            
            // add border and color
            cell.backgroundColor = UIColor.clear
            cell.bgView.layer.cornerRadius = 5;
            cell.bgView.clipsToBounds = true;
            return cell
        }
        else{
            // Empty cell row
            
            let cell:tableCellEmpty = (tableView.dequeueReusableCell(withIdentifier: "cellempty") as! tableCellEmpty?)!
            
            if indexPath.row == 0{
                cell.title.text = "Customize"
            }
            else if indexPath.row == 8{
                cell.title.text = "Extras"
            }
            else{
                cell.title.text = ""
            }
            
            return cell;
        }
        
        //  return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 3:
            // "Purchase"
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "purchaseViewController")
            self.present(vc!, animated: true, completion: nil)
            break;
        case 5:
            // "Rate us"
            
            openUrl(Constants.appurl)
        
        
            break;
        case 7:
            // "Name"
            self.present(alertController, animated: true, completion: nil)
            break;
        case 9:
            // "Help"
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "helpViewController")
           self.present(vc!, animated: true, completion: nil)
            
            break;
        case 11:
            // "Contact"
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "contactViewController")
            self.present(vc!, animated: true, completion: nil)
            break;
        case 13:
            // "Privacy"
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "privacyViewController")
            self.present(vc!, animated: true, completion: nil)
            break;
        default:
            break;
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if string == " " && range.location == 0{
            return false
        }
        
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ")
        
        if string.rangeOfCharacter(from: set.inverted) != nil {
            return false
        }
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            
        }
        return true
        
    }
    
    //hold this reference in your class
    weak var AddAlertSaveAction: UIAlertAction?
    
    func prepareAlert() {
        
        //set up the alertcontroller
        let title = "Please Enter Your Name"
        let message = ""
        let cancelButtonTitle = "Cancel"
        let otherButtonTitle = "Save"
        
        self.alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add the text field with handler
        alertController.addTextField { textField in
            //listen for changes
            textField.delegate = self
            textField.text = UserDefaults.standard.value(forKey: "KidName") as! String
            textField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
            NotificationCenter.default.addObserver(self, selector: #selector(self.handleTextFieldTextDidChangeNotification(notification:)), name: NSNotification.Name.UITextFieldTextDidChange, object: textField)
        }
        
        
        
        
        // Create the actions.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { action in
            NSLog("Cancel Button Pressed")
            self.removeTextFieldObserver()
        }
        
        let otherAction = UIAlertAction(title: otherButtonTitle, style: .default) { action in
            NSLog("Save Button Pressed")
            self.removeTextFieldObserver()
            
             let nameField = self.alertController.textFields![0] as UITextField
            
            if nameField.text!.characters.count == 0{
                return;
            }
            
            UserDefaults.standard.set(nameField.text!, forKey: "KidName")
            UserDefaults.standard.synchronize()
            
            self.contentList.reloadData()
        }
        
        // disable the 'save' button (otherAction) initially
        otherAction.isEnabled = false
        
        // save the other action to toggle the enabled/disabled state when the text changed.
        AddAlertSaveAction = otherAction
        
        // Add the actions.
        alertController.addAction(cancelAction)
        alertController.addAction(otherAction)
        
        
    }
    
    func removeTextFieldObserver() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextFieldTextDidChange, object: alertController.textFields?[0])
    }
    //handler
    @objc func handleTextFieldTextDidChangeNotification(notification: NSNotification) {
        let textField = notification.object as! UITextField
        
        // Enforce a minimum length of >= 1 for secure text alerts.
        AddAlertSaveAction!.isEnabled = (textField.text?.characters.count)! >= 1
    }
    @IBAction func musicON_Action(_ sender: UISwitch) {
        if sender.isOn{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            UserDefaults.standard.set(true, forKey: "isMusicOn")
            UserDefaults.standard.synchronize()
            appDelegate.pausePlaying = false
            appDelegate.playSound()
            
        }
        else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            UserDefaults.standard.set(false, forKey: "isMusicOn")
            UserDefaults.standard.synchronize()
            appDelegate.stopSound()
        }
        
        
    }
    func openUrl(_ urlString:String) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
