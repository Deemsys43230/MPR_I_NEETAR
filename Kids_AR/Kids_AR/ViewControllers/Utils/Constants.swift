//
//  Constants
//  CyberHealths Coach
//
//  Created by DeemsysInc on 23/08/17.
//  Copyright © 2017 Deemsys. All rights reserved.
//


import Foundation
import UIKit

class Constants {
    
    
    //    MARK: - Fonts
    enum FontName: String {
        case Bold = "GothamRounded-Bold"
        case Regular = "GothamRounded-Book"
        case Medium = "GothamRounded-Medium"
        case Light = "GothamRounded-Light"
//        case Bold = "GillSans-Bold"
//        case BoldItalic = "GillSans-BoldItalic"
//        case SemiBold = "GillSans-SemiBold"
//        case SemiBoldItalic = "GillSans-SemiBoldItalic"
//        case Italic = "GillSans-Italic"
    }
    
    //    MARK: - FontSizes
    enum FontSizes: CGFloat {
        case Large = 20.0
        case Medium = 16.0
    }
    
    enum alert:String{
        case info = "Alert"
        case success = "Success"
        case warning = "Warning"
        case ok = "Okay"
    }
    
    enum errorMsg:String{
        case server_error_msg = "Failed to reach server. Please try again later!"
        case data_error_msg = "Failed to load data. Please try again later!"
        case internet_error_msg = "Please check your internet connection!"
        case timeout_msg = "Very slow internet connection. Please try again later!"
    }
    
    
    static let appurl = "itms-apps://itunes.apple.com/us/app/kids-alphabets-ar/id1387392682?ls=1&mt=8"
    
    //    MARK: - APP THEME COLOR
    static let appTheme:UIColor = UIColor(red: 39/255, green: 174/255, blue: 65/255, alpha: 1.0)
    
    static let buttonColor:UIColor = UIColor(red: 33/255, green: 117/255, blue: 155/255, alpha: 1.0)
    
    static let textColor:UIColor = UIColor(red: 122/255, green: 177/255, blue: 224/255, alpha: 1.0)
    
    static let titleColor:UIColor = UIColor.white
    
    static let lockColor:UIColor = UIColor(red: 247/255, green: 220/255, blue: 71/255, alpha: 1.0)
    
     
    
    static let fromEmail:String = "deemmobtest@gmail.com"
    static let fromEmailPwd:String = "deemsys@123"
    
    
    // Production
    //static let toEmail:String = "incdeemsys@gmail.com"
    
    // Developement
   // static let toEmail:String = "deemmobtest@gmail.com"
    
    // Testing
    static let toEmail:String = "deemsystesting@gmail.com"
    
    
    static let relayHost:String = "smtp.gmail.com"
    static let emailSubject:String = "Kids AR - User query"
    static let requiresAuth:Bool = true
    static let wantsSecure:Bool = true
    
 
 static let helpArray = [
    "Welcome to our augmented reality kids AR app.",
    "To get started, give your name on the welcome screen to explore the fun of augmented realities.",
    "To start, choose a category on your home screen.",
    "Try our free models. Locked models are for purchase.",
    "You can customize your app using the settings button.",
    "For unlocking all models go to Settings -> Purchase -> Buy.",
    "For restoring your purchases on a new device or reinstalling app go to Settings -> Purchase -> Restore.",
    "Any queries? Please go to Settings -> Contact us.\n",
    "How to use 3d models?",
    "To simulate a 3d model, press the menu button above your camera screen and choose a model from the list.",
    "Hold your camera still while we detect flat surfaces for placing models.",
    "Once the detected surface is seen, Tap on the surface to place your models.",
    "To zoom your models use two-finger pinch gesture.",
    "To rotate your models use a single finger and slide left or right.",
    "\nHappy Learning!\n"
                   ]
  
   
    
   
    
}

