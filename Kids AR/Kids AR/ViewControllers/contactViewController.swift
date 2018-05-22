//
//  helpViewController.swift
//  Kids AR
//
//  Created by deemsys on 19/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import CFNetwork


class contactViewController : UIViewController, UITextFieldDelegate, SKPSMTPMessageDelegate{
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var queryField: UITextView!
    @IBOutlet var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        
        nameField.delegate = self
        emailField.delegate = self
        
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
        
        
    }
   
    
    @IBAction func backAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
        if self.isBlank(string: self.nameField.text!) == true
        {
            let alertController = UIAlertController(title: Constants.alert.info.rawValue, message: "Enter name", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            return
        }
        if self.isBlank(string: self.emailField.text!) == true
        {
            let alertController = UIAlertController(title: Constants.alert.info.rawValue, message: "Enter email id", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            return
        }
        if self.validateEmail(enteredEmail: emailField.text!) == false{
            let alertController = UIAlertController(title: Constants.alert.info.rawValue, message: "Enter valid email id", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            return
        }
        self.indicator.isHidden = false
        self.indicator.startAnimating()
        sendEmail()
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
    
    let msg:[String:String] = [ "kSKPSMTPPartContentTypeKey" : "text/plain","kSKPSMTPPartMessageKey" : "Hello,\n\n User from Kids AR iOS application has sent a query to you.\n\n User Details\n\n Name : \(self.nameField.text!),\n Email ID : \(self.emailField.text!),\n Query : \(self.queryField.text!)","kSKPSMTPPartContentTransferEncodingKey" : "8bit" ]
    
    
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
        let alertController = UIAlertController(title: Constants.alert.info.rawValue, message: "Query submitted", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
        
    }
    func messageFailed(_ message: SKPSMTPMessage!, error: Error!) {
        let alertController = UIAlertController(title: Constants.alert.info.rawValue, message: "Sorry! We encountered a problem while submitting your query. Please try again later.", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
        
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
        emailField.resignFirstResponder()
        queryField.resignFirstResponder()
    }
}


