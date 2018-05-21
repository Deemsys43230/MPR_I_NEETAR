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
    
    
 
 static let helpArray = [
    "✣ Use yellow square/focus square to target the location",
    "✣ Tap on the focus square to place object",
    "✣ Make yellow marker steady before placing the model for perfect augmentation",
    "✣ Try changing the position if object could not be placed",
    "✣ Pinch to Zoom In and Zoom Out an object",
    "✣ Use ⚙ button to change 3D model settings",
    "✣ Use ↻ button to clear model",
    "✣ Use 🏠 button to go to Chapters list"
    
                   ]
  
   
    
   
    
}

