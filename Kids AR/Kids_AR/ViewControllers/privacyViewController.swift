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
    
    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        
        self.copyright.text = Constants.copyright
        webView.backgroundColor = .clear
        webView.isOpaque = false
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        
            let htmlFile = Bundle.main.path(forResource: "privacyPolicy", ofType: "html")
            let html = try! String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
       
            self.webView.loadHTMLString(html, baseURL: nil)
        }
    }
    
    
    @IBAction func backAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    
}


