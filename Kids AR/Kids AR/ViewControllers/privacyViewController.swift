//
//  helpViewController.swift
//  Kids AR
//
//  Created by deemsys on 19/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit


class privacyViewController : UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var copyright: UILabel!
    
    
    
    override func viewDidLoad() {
        
        self.copyright.text = Constants.copyright
       
        
    }
    
    
    @IBAction func backAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    
}


