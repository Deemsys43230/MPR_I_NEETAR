//
//  congratsView.swift
//  Kids_AR
//
//  Created by deemsys on 11/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


protocol congratsDelegate {
    
    func nextQuestion()
    func gotoExit()
}
 

class congratsView : UIViewController{
    
    var cheerBeep: AVAudioPlayer?
    
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var playNextButton: UIButton!
    
    var confettiView: SAConfettiView!
    var isRainingConfetti = false
    var delegate: congratsDelegate?
    @IBOutlet var innerView: UIView!
    
    @IBOutlet var greetMSG: UIImageView!
    @IBOutlet var viewHeight: NSLayoutConstraint!
    @IBOutlet var viewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.innerView.clipsToBounds = true
        self.innerView.layer.cornerRadius = 5
        self.innerView.layer.borderWidth = 2
        self.innerView.layer.borderColor = UIColor.white.cgColor
        
        setupMusic()
        
        // Create confetti view
        confettiView = SAConfettiView(frame: self.view.bounds)
        confettiView.isUserInteractionEnabled = false
        // Set colors (default colors are red, green and blue)
        confettiView.colors = [UIColor(red:0.95, green:0.40, blue:0.27, alpha:1.0),
                               UIColor(red:1.00, green:0.78, blue:0.36, alpha:1.0),
                               UIColor(red:0.48, green:0.78, blue:0.64, alpha:1.0),
                               UIColor(red:0.30, green:0.76, blue:0.85, alpha:1.0),
                               UIColor(red:0.58, green:0.39, blue:0.55, alpha:1.0)]
        
        // Set intensity (from 0 - 1, default intensity is 0.5)
        confettiView.intensity = 0.5
        
        // Set type
        confettiView.type = .diamond
        
        // For custom image
        // confettiView.type = .Image(UIImage(named: "diamond")!)
       let x = Int((arc4random()%3))
        if x == 0{
            self.greetMSG.image = #imageLiteral(resourceName: "greet1")
        }
        else if x == 1{
            self.greetMSG.image = #imageLiteral(resourceName: "greet3")
        }else{
            self.greetMSG.image = #imageLiteral(resourceName: "greet4")
        }
        // Add subview
        view.addSubview(confettiView)
        
        confettiView.startConfetti()
        
       
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        
        }
    
    override func viewWillLayoutSubviews() {
        if UIDevice.current.model == "iPhone"{
            
            if self.view.frame.width == 320{
                viewWidth.constant = 310
                viewHeight.constant = 500
                 self.innerView.layoutIfNeeded()
                self.view.layoutIfNeeded()
                self.innerView.layoutIfNeeded()
            }else{
                viewWidth.constant = 360
                viewHeight.constant = 600
              self.innerView.layoutIfNeeded()
                self.view.layoutIfNeeded()
                self.innerView.layoutIfNeeded()
            }
            print(self.innerView.frame)
          /*  let closeButton = UIButton(type: .custom)
            closeButton.frame = CGRect(x:self.innerView.frame.width-30, y: 10, width: 30, height: 30)
            closeButton.setImage(#imageLiteral(resourceName: "collectionclose"), for: .normal)
            closeButton.addTarget(self, action:#selector(close(_:)), for: .touchUpInside)
            self.view.addSubview(closeButton)
            
            
            let nextButton = UIButton(type: .custom)
            nextButton.frame = CGRect(x:self.innerView.center.x - 150, y: self.innerView.frame.height-100, width: 240, height: 50)
            nextButton.setTitle("PLAY NEXT", for: .normal)
            nextButton.titleLabel?.font = UIFont(name: Constants.FontName.Bold.rawValue, size: 25)
            nextButton.backgroundColor = Constants.lockColor
            nextButton.addTarget(self, action:#selector(playNext(_:)), for: .touchUpInside)
            self.view.addSubview(nextButton)*/
        }
        else{
            viewWidth.constant = 560
            viewHeight.constant = 795
            self.innerView.layoutIfNeeded()
        }
    }
    
    func setupMusic(){
        guard  let path  = Bundle.main.url(forResource: "kidsCheer", withExtension: "mp3") else{return}
        do {
            let mplayer = try AVAudioPlayer(contentsOf: path, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player:AVAudioPlayer = mplayer else { return}
            player.numberOfLoops = -1
            player.volume = 1.0
            
            self.cheerBeep = player
            
            self.cheerBeep?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        return
    }
        func showAnimate()
        {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            UIView.animate(withDuration: 0.25, animations: {
                self.view.alpha = 1.0
                self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            });
        }
    
        func removeAnimate()
        {
            UIView.animate(withDuration: 0.25, animations: {
                self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
            });
        }
    
    @IBAction func close(_ sender: Any) {
        self.confettiView.stopConfetti()
        self.removeAnimate()
        if self.cheerBeep != nil{
            self.cheerBeep?.stop()
            self.cheerBeep?.currentTime = 0
            self.cheerBeep = nil
        }
    }
    @IBAction func exitFromView(_ sender: Any) {
        self.confettiView.stopConfetti()
        self.removeAnimate()
        if self.cheerBeep != nil{
            self.cheerBeep?.stop()
            self.cheerBeep?.currentTime = 0
            self.cheerBeep = nil
        }
       delegate?.gotoExit()
    }
    @IBAction func playNext(_ sender: Any) {
        self.confettiView.stopConfetti()
        self.removeAnimate()
        delegate?.nextQuestion()
        if self.cheerBeep != nil{
            self.cheerBeep?.stop()
            self.cheerBeep?.currentTime = 0
            self.cheerBeep = nil
        }
    }
}
