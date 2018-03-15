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
        case Regular = "GillSans-Regular"
        case UltraBold = "GillSans-UltraBold"
        case Bold = "GillSans-Bold"
        case BoldItalic = "GillSans-BoldItalic"
        case SemiBold = "GillSans-SemiBold"
        case SemiBoldItalic = "GillSans-SemiBoldItalic"
        case Italic = "GillSans-Italic"
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
    }
    
    enum errorMsg:String{
        case server_error_msg = "Failed to reach server. Please try again later!"
        case data_error_msg = "Failed to load data. Please try again later!"
        case internet_error_msg = "Please check your internet connection!"
        case timeout_msg = "Very slow internet connection. Please try again later!"
    }
 
  
    
    //    MARK: - APP THEME COLOR
    static let appTheme:UIColor = UIColor(red: 39/255, green: 174/255, blue: 65/255, alpha: 1.0)
 
  
  
   
    
   
    
}

