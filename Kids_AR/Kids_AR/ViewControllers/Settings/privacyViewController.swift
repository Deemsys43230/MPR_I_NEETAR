//
//  helpViewController.swift
//  Kids AR
//
//  Created by deemsys on 19/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit


class privacyViewController : UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var copyright: UILabel!
    
    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        
        let year = Calendar.current.component(Calendar.Component.year, from: Date())
        
         let copyright="Copyright © \(year) Deemsys Inc. All Rights Reserved."
        self.copyright.text = copyright
        webView.backgroundColor = .clear
        webView.isOpaque = false
       webView.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        self.indicator.startAnimating()
            let htmlFile = Bundle.main.path(forResource: "privacyPolicy", ofType: "html")
            let html = try! String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
       
            self.webView.loadHTMLString(html, baseURL: nil)
        }
    }
    
    
    @IBAction func backAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.indicator.stopAnimating()
    }
    
    
}


