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
import Firebase

class NameViewController: UIViewController, UITextFieldDelegate,AVSpeechSynthesizerDelegate {
    
    var kbHeight: CGFloat!
    var musicPlaying:Bool!
    @IBOutlet var logoView: UIView!
    @IBOutlet var infoButton: UIButton!
    @IBOutlet var musicButton: UIButton!
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var muteLAbel: UILabel!
    let speechSynthesizer = AVSpeechSynthesizer()
    
    
    @IBOutlet var titleLabel1: UILabel!
    @IBOutlet var titleLabel2: UILabel!
    
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var pleasetelluslabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet weak var nameHeight: NSLayoutConstraint!
    @IBOutlet weak var getStartedHeight: NSLayoutConstraint!
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    @IBOutlet var getStartedBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoView.layer.cornerRadius = 5;
        logoView.clipsToBounds = true;
        
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
        
        self.musicPlaying = false
        
        
        //        for family: String in UIFont.familyNames
        //        {
        //            print("\(family)")
        //            for names: String in UIFont.fontNames(forFamilyName: family)
        //            {
        //                print("== \(names)")
        //            }
        //        }
        //    }
        //
        //
        //
        
        if self.view.frame.width == 320{
            titleLabel1.font = UIFont(name: titleLabel1.font.fontName, size:28)
            titleLabel2.font = UIFont(name: titleLabel2.font.fontName, size:28)
            detailLabel.font =  UIFont(name: detailLabel.font.fontName, size:13)
            nameLabel.font =  UIFont(name: nameLabel.font.fontName, size:18)
            nameHeight.constant = 30
            getStartedHeight.constant = 35
            viewWidth.constant = 110
            viewHeight.constant = 110
            getStartedBottom.constant = 10
            
            
            self.view.layoutIfNeeded()
            
            viewWidth.constant = 110
            viewHeight.constant = 110
            self.view.layoutIfNeeded()
            
            imageWidth.constant = 105
            imageHeight.constant = 105
            self.logoView.layoutIfNeeded()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            
            self.present((self.storyboard?.instantiateViewController(withIdentifier: "helpViewController"))!, animated: false, completion: nil)
        }
        
        
    }
    
    
    func pin(_ mode: ALMode) {
        
        var appearance = ALAppearance()
        appearance.title = "Set Parental Passcode"
        appearance.isSensorsEnabled = false
        AppLocker.present(with: mode, and: appearance)
    }
    @objc func pinSuccessful() {
        print("pinSuccessful - NameVC")
        
        if self.musicPlaying == false {
            self.musicPlaying = true
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.pausePlaying = true
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
            
            
            self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "welcomeViewController"))!, animated: true)
        }
    }
    @objc  func didCancelScreen() {
        print("SCREEN CACNCELLED")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        centerAlignUsernameLabel.constant += view.bounds.width
        centerAlignUsername.constant += view.bounds.width
        getStartedButton.alpha = 0.0
        
        let nameval = UserDefaults.standard.value(forKey: "KidName") as! String
        
        if nameval.characters.count != 0{
            nameField.text = nameval
        }
        
        
        if (nameField.text?.characters.count)! > 0{
            showButton()
        }
        
        let music =   UserDefaults.standard.value(forKey: "isMusicOn") as! Bool
        if music == false{
            musicButton.setImage(#imageLiteral(resourceName: "audio-speaker-off"), for: .normal)
            muteLAbel.text = "Unmute"
        }
        else{
            musicButton.setImage(#imageLiteral(resourceName: "audio-speaker-on"), for: .normal)
            muteLAbel.text = "Mute"
            
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(pinSuccessful), name: NSNotification.Name(rawValue: "successLocker"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didCancelScreen), name: NSNotification.Name(rawValue: "cancelLocker"), object: nil)
        
    }
    deinit {
        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "successLocker"))
        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "cancelLocker"))
        NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillShow)
        NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillHide)
NotificationCenter.default.removeObserver(self)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "successLocker"))
//        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "cancelLocker"))
       // NotificationCenter.default.removeObserver(self)
        
         NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillShow)
        NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillHide)
        NotificationCenter.default.removeObserver(self)
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
    @objc func keyboardWillShow(notification: NSNotification) {
        if UIDevice.current.model == "iPhone" {
            if let userInfo = notification.userInfo {
                if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                    kbHeight = keyboardSize.height
                    self.animateTextField(up: true)
                }
            }
            
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if UIDevice.current.model == "iPhone" {
            self.animateTextField(up: false)
        }
    }
    
    func animateTextField(up: Bool) {
        var movement = (up ? -kbHeight : kbHeight)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement!)
        })
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
                
                let maxLength = 18
                if updatedText.characters.count <= maxLength{
                    showButton()
                    return true
                }
                return false
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
    
    //    @IBOutlet var logoTopHeight: NSLayoutConstraint!
    //
    //
    //    @IBOutlet var labelTop: NSLayoutConstraint!
    //
    //    @IBOutlet var labelCenter: NSLayoutConstraint!
    
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
        
        pin(.create)
        
        // Firebase event
        Analytics.logEvent("GetStarted_Tapped_iOS", parameters: nil)
        
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
            
            musicButton.setImage(#imageLiteral(resourceName: "audio-speaker-off"), for: .normal)
            musicButton.setImage(#imageLiteral(resourceName: "audio-speaker-off"), for: .highlighted)
            muteLAbel.text = "Unmute"
            UserDefaults.standard.set(false, forKey: "isMusicOn")
            UserDefaults.standard.synchronize()
            
            appDelegate.stopSound()
            
        }
        else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            musicButton.setImage(#imageLiteral(resourceName: "audio-speaker-on"), for: .normal)
            musicButton.setImage(#imageLiteral(resourceName: "audio-speaker-on"), for: .highlighted)
            muteLAbel.text = "Mute"
            UserDefaults.standard.set(true, forKey: "isMusicOn")
            UserDefaults.standard.synchronize()
            appDelegate.pausePlaying = false
            appDelegate.playSound()
        }
        
    }
    /// AVFoundation Completion handlers
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //        appDelegate.playSound()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}


