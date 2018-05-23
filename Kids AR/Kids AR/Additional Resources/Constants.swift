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
        case Bold = "ComicSansMS-Bold"
        case Regular = "ComicSansMS"
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
     
    
    //    MARK: - APP THEME COLOR
    static let appTheme:UIColor = UIColor(red: 39/255, green: 174/255, blue: 65/255, alpha: 1.0)
    
    static let buttonColor:UIColor = UIColor(red: 33/255, green: 117/255, blue: 155/255, alpha: 1.0)
    
    static let textColor:UIColor = UIColor(red: 122/255, green: 177/255, blue: 224/255, alpha: 1.0)
    
    static let titleColor:UIColor = UIColor.white
    
    static let lockColor:UIColor = UIColor(red: 33/255, green: 117/255, blue: 155/255, alpha: 1.0)
    
    static let copyright="Copyright © 2018 Deemsys Inc. All Right Reserved."
    
    static let fromEmail:String = "deemmobtest@gmail.com"
    static let fromEmailPwd:String = "deemsys@123"
    static let toEmail:String = "support@deemsysinc.com"
    static let relayHost:String = "smtp.gmail.com"
    static let emailSubject:String = "Kids AR - User query"
    static let requiresAuth:Bool = true
    static let wantsSecure:Bool = true
    
 
 static let helpArray = [
    "\n✣ Welcome to our augmented reality kids AR app.",
    "\n✣ To get started give your name on welcome screen to explore the fun of augmented realities.",
    "\n✣ Choose a category on your home screen and press start.",
    "\n✣ You will be given few models for free and you need to purchase locked models for using it.",
    "\n✣ You can customise your app under settings button.",
    "\n✣ For unlocking all models go to Settings->Purchase-> click buy.",
    "\n✣ For restoring your purchases on new device or  reinstalling app goto Settings-> Purchase -> click restore.",
    "\n✣ Any Queries? Please send us through Settings->Contact us.\n",
    "\nHow to use 3d models?",
    "\n✣ To simulate a 3d model, press the menu button on top of your camera screen to choose a model from the list.",
    "\n✣ Hold your camera still while we detect flat surfaces for placing models.",
    "\n✣ Once you see surface detected , Tap on the surface to place your models.",
    "\n✣ To zoom your models use two finger pinch gesture.",
    "\n✣ To rotate your models use single finger and slide left or right.",
    "\nHappy Learning!\n"
                   ]
  
   
    
   
    
}

