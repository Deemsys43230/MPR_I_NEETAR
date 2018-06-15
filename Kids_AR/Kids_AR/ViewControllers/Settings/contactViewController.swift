//
//  helpViewController.swift
//  Kids AR
//
//  Created by deemsys on 19/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import CFNetwork

import UIKit

public enum Model : String {
    case simulator   = "simulator/sandbox",
    iPod1            = "iPod 1",
    iPod2            = "iPod 2",
    iPod3            = "iPod 3",
    iPod4            = "iPod 4",
    iPod5            = "iPod 5",
    iPad2            = "iPad 2",
    iPad3            = "iPad 3",
    iPad4            = "iPad 4",
    iPhone4          = "iPhone 4",
    iPhone4S         = "iPhone 4S",
    iPhone5          = "iPhone 5",
    iPhone5S         = "iPhone 5S",
    iPhone5C         = "iPhone 5C",
    iPadMini1        = "iPad Mini 1",
    iPadMini2        = "iPad Mini 2",
    iPadMini3        = "iPad Mini 3",
    iPadAir1         = "iPad Air 1",
    iPadAir2         = "iPad Air 2",
    iPadPro9_7       = "iPad Pro 9.7\"",
    iPadPro9_7_cell  = "iPad Pro 9.7\" cellular",
    iPadPro10_5      = "iPad Pro 10.5\"",
    iPadPro10_5_cell = "iPad Pro 10.5\" cellular",
    iPadPro12_9      = "iPad Pro 12.9\"",
    iPadPro12_9_cell = "iPad Pro 12.9\" cellular",
    iPhone6          = "iPhone 6",
    iPhone6plus      = "iPhone 6 Plus",
    iPhone6S         = "iPhone 6S",
    iPhone6Splus     = "iPhone 6S Plus",
    iPhoneSE         = "iPhone SE",
    iPhone7          = "iPhone 7",
    iPhone7plus      = "iPhone 7 Plus",
    iPhone8          = "iPhone 8",
    iPhone8plus      = "iPhone 8 Plus",
    iPhoneX          = "iPhone X",
    unrecognized     = "?unrecognized?"
}

public extension UIDevice {
    public var type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
                
            }
        }
        var modelMap : [ String : Model ] = [
            "i386"       : .simulator,
            "x86_64"     : .simulator,
            "iPod1,1"    : .iPod1,
            "iPod2,1"    : .iPod2,
            "iPod3,1"    : .iPod3,
            "iPod4,1"    : .iPod4,
            "iPod5,1"    : .iPod5,
            "iPad2,1"    : .iPad2,
            "iPad2,2"    : .iPad2,
            "iPad2,3"    : .iPad2,
            "iPad2,4"    : .iPad2,
            "iPad2,5"    : .iPadMini1,
            "iPad2,6"    : .iPadMini1,
            "iPad2,7"    : .iPadMini1,
            "iPhone3,1"  : .iPhone4,
            "iPhone3,2"  : .iPhone4,
            "iPhone3,3"  : .iPhone4,
            "iPhone4,1"  : .iPhone4S,
            "iPhone5,1"  : .iPhone5,
            "iPhone5,2"  : .iPhone5,
            "iPhone5,3"  : .iPhone5C,
            "iPhone5,4"  : .iPhone5C,
            "iPad3,1"    : .iPad3,
            "iPad3,2"    : .iPad3,
            "iPad3,3"    : .iPad3,
            "iPad3,4"    : .iPad4,
            "iPad3,5"    : .iPad4,
            "iPad3,6"    : .iPad4,
            "iPhone6,1"  : .iPhone5S,
            "iPhone6,2"  : .iPhone5S,
            "iPad4,1"    : .iPadAir1,
            "iPad4,2"    : .iPadAir2,
            "iPad4,4"    : .iPadMini2,
            "iPad4,5"    : .iPadMini2,
            "iPad4,6"    : .iPadMini2,
            "iPad4,7"    : .iPadMini3,
            "iPad4,8"    : .iPadMini3,
            "iPad4,9"    : .iPadMini3,
            "iPad6,3"    : .iPadPro9_7,
            "iPad6,11"   : .iPadPro9_7,
            "iPad6,4"    : .iPadPro9_7_cell,
            "iPad6,12"   : .iPadPro9_7_cell,
            "iPad6,7"    : .iPadPro12_9,
            "iPad6,8"    : .iPadPro12_9_cell,
            "iPad7,3"    : .iPadPro10_5,
            "iPad7,4"    : .iPadPro10_5_cell,
            "iPhone7,1"  : .iPhone6plus,
            "iPhone7,2"  : .iPhone6,
            "iPhone8,1"  : .iPhone6S,
            "iPhone8,2"  : .iPhone6Splus,
            "iPhone8,4"  : .iPhoneSE,
            "iPhone9,1"  : .iPhone7,
            "iPhone9,2"  : .iPhone7plus,
            "iPhone9,3"  : .iPhone7,
            "iPhone9,4"  : .iPhone7plus,
            "iPhone10,1" : .iPhone8,
            "iPhone10,2" : .iPhone8plus,
            "iPhone10,3" : .iPhoneX,
            "iPhone10,6" : .iPhoneX
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            return model
        }
        return Model.unrecognized
    }
}

class contactViewController : UIViewController, UITextFieldDelegate, SKPSMTPMessageDelegate, UITextViewDelegate{
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var queryField: UITextView!
    @IBOutlet var submitButton: UIButton!
    
    @IBOutlet var scrollView: UIScrollView!
    
    var devicename = ""
    var osversion = ""
    var appversion = ""
    
    override func viewDidLoad() {
        
        nameField.delegate = self
        emailField.delegate = self
        queryField.delegate = self
        
        submitButton.layer.cornerRadius = 5;
        submitButton.clipsToBounds = true;
        
        nameField.layer.cornerRadius=20;
        nameField.clipsToBounds=true;
        
        emailField.layer.cornerRadius=20;
        emailField.clipsToBounds=true;
        
        queryField.layer.cornerRadius=5;
        queryField.clipsToBounds=true;
       // queryField.layer.borderColor = UIColor.lightGray.cgColor
       // queryField.layer.borderWidth = 1
        
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        nameField.leftView = paddingView
        nameField.leftViewMode = .always
        let emailpaddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        emailField.leftView = emailpaddingView
        emailField.leftViewMode = .always
        
        self.devicename = UIDevice().type.rawValue
        self.osversion = UIDevice.current.systemVersion
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
             self.appversion = version
        }
       
        
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        NotificationCenter.default.removeObserver(self)
//    }
    
    @IBAction func backAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
        if self.isBlank(string: self.nameField.text!) == true
        {
            let alertController = UIAlertController(title: "Info", message: "Enter name", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            return
        }
        if self.isBlank(string: self.emailField.text!) == true
        {
            let alertController = UIAlertController(title: "Info", message: "Enter email id", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            return
        }
        if self.isBlank(string: self.queryField.text!) == true
        {
            let alertController = UIAlertController(title: "Info", message: "Enter query", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            return
        }
        if self.validateEmail(enteredEmail: emailField.text!) == false{
            let alertController = UIAlertController(title: "Info", message: "Enter valid email id", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            return
        }
        let R:Reachability = Reachability()
        if R.isConnectedToNetwork() == true {
            
            self.indicator.isHidden = false
            self.indicator.startAnimating()
            sendEmail()
            
        } else {
            self.indicator.stopAnimating()
            self.submitButton.isEnabled = true
            let alertController = UIAlertController(title: "No Internet Connection!", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
        }
        
        
       
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        //        print(emailPredicate.evaluate(with: enteredEmail))
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    func isBlank(string:String) -> Bool {
        let trimmed = string.trimmingCharacters(in: CharacterSet.whitespaces)
        return trimmed.isEmpty
    }
    
   func sendEmail(){
    
    self.submitButton.isEnabled = false
    
    let msg:[String:String] = [ "kSKPSMTPPartContentTypeKey" : "text/plain","kSKPSMTPPartMessageKey" : "Hello,\n\n User from Kids AR iOS application has sent a query to you.\n\n USER DETAILS\n\n Name : \(self.nameField.text!)\n Email ID : \(self.emailField.text!)\n Query : \(self.queryField.text!)\n\n DEVICE INFORMATION\n\n Device Name : \(self.devicename)\n OS Version : \(self.osversion)\n App Version : \(self.appversion)\n","kSKPSMTPPartContentTransferEncodingKey" : "8bit" ]
    
    
    let anotherQueue = DispatchQueue(label: "com.deemsys.anotherQueue", qos: .utility, attributes: .concurrent)
    
    let textmsg  =  SKPSMTPMessage()
    textmsg.fromEmail = Constants.fromEmail
    textmsg.toEmail = Constants.toEmail
    textmsg.relayHost = Constants.relayHost
    textmsg.requiresAuth = Constants.requiresAuth
    textmsg.login = Constants.fromEmail
    textmsg.pass = Constants.fromEmailPwd
    textmsg.wantsSecure = Constants.wantsSecure
    textmsg.subject =  Constants.emailSubject
    textmsg.delegate = self
    textmsg.parts = [msg]
    
  anotherQueue.async {
        textmsg.send()
    }
    }
    func messageSent(_ message: SKPSMTPMessage!) {
        self.indicator.stopAnimating()
        self.submitButton.isEnabled = true
        self.nameField.text = ""
        self.emailField.text = ""
        self.queryField.text = ""
        let alertController = UIAlertController(title: "Success", message: "Query submitted", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
        
        
    }
    func messageFailed(_ message: SKPSMTPMessage!, error: Error!) {
        let alertController = UIAlertController(title: "Failure", message: "Sorry! We encountered a problem while submitting your query. Please try again later.", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
        
    }
    // MARK: UITextViewDelegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if UIDevice.current.model == "iPhone" {
            let scrollPoint : CGPoint = CGPoint(x: 0, y: self.queryField.frame.origin.y-100)
            self.scrollView.setContentOffset(scrollPoint, animated: true)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if UIDevice.current.model == "iPhone" {
            self.scrollView.setContentOffset(CGPoint.zero, animated: true)
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if UIDevice.current.model == "iPhone" {
             self.queryField.resignFirstResponder()
        }
       
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField{
            nameField.resignFirstResponder()
            
        }
        else{
            emailField.resignFirstResponder()
        }
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      if textField == nameField {
        if string == " " && range.location == 0{
            return false
        }
        
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ")
        
        if string.rangeOfCharacter(from: set.inverted) != nil {
            return false
        }
        
        }
        
        return true
    }
//    var kbHeight: CGFloat!
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let userInfo = notification.userInfo {
//            if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//                kbHeight = keyboardSize.height
//                self.animateTextField(up: true)
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        self.animateTextField(up: false)
//    }
//    func animateTextField(up: Bool) {
//        var movement = (up ? -kbHeight : kbHeight)
//
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement!)
//        })
//    }
}


