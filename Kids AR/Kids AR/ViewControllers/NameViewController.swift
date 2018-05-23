//
//  ViewController.swift
//  Kids AR
//
//  Created by deemsys on 17/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation

class NameViewController: UIViewController, UITextFieldDelegate,AVSpeechSynthesizerDelegate {
    
    @IBOutlet var infoButton: UIButton!
    @IBOutlet var musicButton: UIButton!
    @IBOutlet var musicImage: UIImageView!
    @IBOutlet var nameField: UITextField!
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        nameField.delegate = self
        
        infoButton.layer.cornerRadius = 5;
        infoButton.clipsToBounds = true;
        
        musicButton.layer.cornerRadius = 5;
        musicButton.clipsToBounds = true;
        
        getStartedButton.layer.cornerRadius = 5;
        getStartedButton.clipsToBounds = true;
        
        nameField.layer.cornerRadius=20;
        nameField.clipsToBounds=true;
        
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        nameField.leftView = paddingView
        nameField.leftViewMode = .always
        
        speechSynthesizer.delegate = self
        
        
        
//        for family: String in UIFont.familyNames
//        {
//            print("\(family)")
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                print("== \(names)")
//            }
//        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerAlignUsernameLabel.constant += view.bounds.width
        centerAlignUsername.constant += view.bounds.width
        getStartedButton.alpha = 0.0
        
       nameField.text = UserDefaults.standard.value(forKey: "KidName") as! String
        
        if (nameField.text?.characters.count)! > 0{
            showButton()
        }
        
        let music =   UserDefaults.standard.value(forKey: "isMusicOn") as! Bool
        if music == false{
            musicImage.image = #imageLiteral(resourceName: "audio-speaker-off")
            
        }
        else{
            musicImage.image = #imageLiteral(resourceName: "audio-speaker-on")
            
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.centerAlignUsernameLabel.constant -= self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            self.centerAlignUsername.constant -= self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
       
        
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
        if let text = nameField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            if updatedText.characters.count > 0{
                showButton()
            }
            else{
                hideButton()
            }
        }
        return true
        
    }
    
    @IBOutlet weak var centerAlignUsernameLabel: NSLayoutConstraint!
    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    @IBOutlet weak var getStartedButton: UIButton!
    
    var alert : UIAlertController!
    
    @IBAction func getStartedAction(sender: UIButton) {
        
      /*  if nameField.text!.characters.count == 0{
        
        let bounds = self.getStartedButton.bounds
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .autoreverse, animations: {
                self.getStartedButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
                self.getStartedButton.isEnabled = false
            }) { (sdf) in
                self.alert = UIAlertController(title: Constants.alert.info.rawValue, message: "Enter your name", preferredStyle: .alert)
                self.alert.addAction(UIAlertAction(title: Constants.alert.ok.rawValue, style: UIAlertActionStyle.default, handler: nil))
                self.present(self.alert, animated: true, completion: nil)
            }
            
        }*/
        if nameField.text!.characters.count == 0{
            return;
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.pauseSound()
        if !speechSynthesizer.isSpeaking {
            let speechUtterance = AVSpeechUtterance(string: "Welcome \(nameField.text!)")
            speechSynthesizer.speak(speechUtterance)
        }
        else{
            speechSynthesizer.continueSpeaking()
        }
        UserDefaults.standard.set(nameField.text!, forKey: "KidName")
        UserDefaults.standard.synchronize()
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "CRViewController"))!, animated: true)
    }
    
    func showButton(){
        UIView.animate(withDuration: 0.5, delay: 0.4, options: .curveEaseOut, animations: {
            self.getStartedButton.alpha = 1
        }, completion: nil)
    }
    func hideButton(){
        UIView.animate(withDuration: 0.5, delay: 0.4, options: .curveEaseOut, animations: {
            self.getStartedButton.alpha = 0
        }, completion: nil)
    }
    
    
    @IBAction func infoAction(_ sender: Any) {
    }
    
    @IBAction func musicAction(_ sender: Any) {
     let music =   UserDefaults.standard.value(forKey: "isMusicOn") as! Bool
        if music == true{
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            musicImage.image = #imageLiteral(resourceName: "audio-speaker-off")
             UserDefaults.standard.set(false, forKey: "isMusicOn")
            UserDefaults.standard.synchronize()
            
            appDelegate.stopSound()
            
        }
        else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            musicImage.image = #imageLiteral(resourceName: "audio-speaker-on")
            UserDefaults.standard.set(true, forKey: "isMusicOn")
            UserDefaults.standard.synchronize()
            
            appDelegate.playSound()
        }
        
    }
    /// AVFoundation Completion handlers
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.playSound()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

