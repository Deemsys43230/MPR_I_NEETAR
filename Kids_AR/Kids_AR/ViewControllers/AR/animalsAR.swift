//
//  animalsAR.swift
//  Kids_AR
//
//  Created by deemsys on 18/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class animalsAR: UIViewController, popupDelegate {
    
    @IBOutlet var hintView: UIView!
    @IBOutlet var hintSubView: UIView!
     @IBOutlet var openColl: UIButton!
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var indicatorLabel: UILabel!
    @IBOutlet var indicatorParentView: UIView!
    
    var unityView: UIView?
    
    @IBOutlet var hintHeight: NSLayoutConstraint!
    
    
    @IBOutlet var modeltitle: UILabel!
    
    
    @objc public var index:Int = 0
    
    var animationButton:UIButton!
    var speakerButton:UIButton!
    var cameraButton:UIButton!
    
     var viewname:[String] = ["alphabetsScene","animalsScene","fruitsScene"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.indicator.startAnimating()
        self.indicatorParentView.isHidden = false
        
        NotificationCenter.default.addObserver(self,selector: #selector(handleAnimalButtons(notfication:)), name:.animalNotifi, object:nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showButtons(notfication:)), name: .postNotifi, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleLoading(notfication:)), name: .loadedNotifi, object: nil)
        
        if index == 0{
            self.modeltitle.text = "Alphabets"
        }
        else if index == 1{
            self.modeltitle.text = "ALLIGATOR"
        }
        else if index == 2{
            self.modeltitle.text = "APPLE"
        }
        
        
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        
        switch cameraAuthorizationStatus {
        case .denied:
            var alert : UIAlertController!
            alert = UIAlertController(title: "Info", message: "Please enable access to camera to continue using application", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Constants.alert.ok.rawValue, style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            break
        case .authorized:
            break
        case .restricted: break
            
        case .notDetermined:
            // Prompting user for the permission to use the camera.
            AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
                if granted {
                    print("Granted access to \(cameraMediaType)")
                } else {
                    print("Denied access to \(cameraMediaType)")
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.startUnity()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        UnityPostMessage("GameObject", "clearScene", "")
        NotificationCenter.default.removeObserver(self, name: .postNotifi, object: nil)
        NotificationCenter.default.removeObserver(self, name: .loadedNotifi, object: nil)
    }
    
    @objc func handleAnimalButtons(notfication: NSNotification){
       // print("Animation Status :::: \(notfication.userInfo!["text"])")
         let currentStatus = notfication.userInfo!["text"] as! String
        
        if self.animationButton == nil{
            return
        }
        
        if currentStatus == "true"{
            self.animationButton.setTitle("STOP", for: .normal)
        }else{
            self.animationButton.setTitle("START", for: .normal)
        }
        
    }
    @objc func showButtons(notfication: NSNotification) {
        if self.cameraButton.isHidden == true {
            self.cameraButton.isHidden = false
        }
        if self.speakerButton.isHidden == true {
            self.speakerButton.isHidden = false
        }
        if self.animationButton.isHidden == true {
            self.animationButton.isHidden = false
        }
        
    }
    
    @objc func handleLoading(notfication: NSNotification){
        print(notfication.userInfo!["text"])
        let currentView = notfication.userInfo!["text"] as! String
        let choosenView = self.viewname[self.index]
        if choosenView == currentView {
            print("SCENE LOADED")
            self.indicator.stopAnimating()
            self.indicatorParentView.isHidden = true
            enable_disableAllViews(status: true)
            
            let instructionsShowed = UserDefaults.standard.value(forKey: "instructionsShowed") as! Bool
            
            if instructionsShowed == true{
                
                self.openCollections()
            }
            else{
                showHintAlert()
            }
        }
        else{
            // SHOW INDICATOR
            self.indicator.startAnimating()
            self.indicatorParentView.isHidden = false
            enable_disableAllViews(status: false)
        }
    }
    
    func didSelectModel(withName: String, audioName: String, modelID: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.pausePlaying = true
        appDelegate.pauseSound()
        
        self.cameraButton.isHidden = true
        self.speakerButton.isHidden = true
        self.animationButton.isHidden = true
     
        
        if index != 0{
            
            self.modeltitle.text = withName
        }
        
        
        let c = withName.characters.first!
        UnityPostMessage("GameObject", "loadAlphabet", "\(c)")
        
        
        var val = UserDefaults.standard.value(forKey: "rateus") as! Int
        val = val + 1
        if val == 4 || val == 8 || val == 12{
            // Show rate us alert
            let alert:UIAlertController = UIAlertController(title: "Rate us", message: "Hope you enjoyed using our app! Would you like to rate us?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Rate", style: .default, handler: { (action) in
                // redirect to appstore
                settingsViewController().openUrl(Constants.appurl)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        if val <= 13{
            UserDefaults.standard.set(val, forKey: "rateus")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func openCollections(){
        
        if let topController = UIApplication.topViewController(), (topController is PopUpViewController) {
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.pausePlaying = true
        appDelegate.pauseSound()
        let popOverVC = UIStoryboard(name: "UnityStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        popOverVC.index = self.index
        popOverVC.delegate = self
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func showAlphabet(_ sender: UIButton) {
        
        self.openCollections()
        
    }
    
    @IBAction func captureScreen(_ sender: Any) {
        
        UnityPostMessage("GameObject", "captureScreen", "")
        Toast.showMessage(message: "Image saved! Tap the Photos icon to view the image")
    }
    
    
    @IBAction func playMusic(_ sender: Any) {
        self.playAudioSound()
        self.animationButton.setTitle("START", for: .normal)
    }
    func playAudioSound(){
        
        // print(AVAudioSession.sharedInstance().outputVolume)
        
        if  AVAudioSession.sharedInstance().outputVolume == 0  {
            Toast.showNegativeMessage(message: "For the application to work correctly, you must increase 'Media Volume'. If you did not, you can not hear the music.")
        }
        
        
        UnityPostMessage("GameObject", "playMusic", "")
        
        
    }
    @objc  func startUnity() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let topController = UIApplication.topViewController(), !(topController is animalsAR) {
            return
        }
        
        appDelegate.startUnity()
        
        unityView = UnityGetGLView()!
        enable_disableAllViews(status: false)
        
        if self.view == nil{
            print("self.view is null")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.startUnity()
            }
        }
        unityView?.frame = CGRect(x: 0, y: 85, width: self.view.frame.width, height: self.view.frame.height - 85)
        self.view!.addSubview(unityView!)
        unityView!.translatesAutoresizingMaskIntoConstraints = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 ) {
            
            UnityPostMessage("GameObject", "restartMentionedScene",  self.viewname[self.index])
        }
        
        // look, non-full screen unity content!
        //        let views = ["view": unityView]
        //        let w = NSLayoutConstraint.constraints(withVisualFormat: "|-0-[view]-0-|", options: [], metrics: nil, views: views)
        //        let h = NSLayoutConstraint.constraints(withVisualFormat: "V:|-85-[view]-0-|", options: [], metrics: nil, views: views)
        //        view.addConstraints(w + h)
        
        
        speakerButton = UIButton(type: .custom)
        speakerButton.backgroundColor = .clear
        speakerButton.setImage(#imageLiteral(resourceName: "speaker"), for: .normal)
        speakerButton.addTarget(self, action:#selector(self.playMusic(_:)), for: .touchUpInside)
        self.view.addSubview(speakerButton)
        
        speakerButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        cameraButton = UIButton(type: .custom)
        cameraButton.backgroundColor = .clear
        cameraButton.setImage(#imageLiteral(resourceName: "camera"), for: UIControlState.normal)
        cameraButton.addTarget(self, action:#selector(self.captureScreen(_:)), for: .touchUpInside)
        self.view.addSubview(cameraButton)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        animationButton = UIButton(type: .custom)
        animationButton.backgroundColor = .clear
        animationButton.setTitle("STOP", for: .normal)
        animationButton.setTitleColor(UIColor.white, for: .normal)
        animationButton.backgroundColor = UIColor.blue
        animationButton.addTarget(self, action:#selector(playAnimation(_:)), for: .touchUpInside)
        self.view.addSubview(animationButton)
        animationButton.isUserInteractionEnabled = true
        animationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cameraButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -110),
            cameraButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            cameraButton.widthAnchor.constraint(equalToConstant: 50),
            cameraButton.heightAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate([
            speakerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 110),
            speakerButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            speakerButton.widthAnchor.constraint(equalToConstant: 50),
            speakerButton.heightAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate([
            animationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            animationButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            animationButton.widthAnchor.constraint(equalToConstant: 120),
            animationButton.heightAnchor.constraint(equalToConstant: 40)])
        
        self.cameraButton.isHidden = true
        self.speakerButton.isHidden = true
        self.animationButton.isHidden = true
        
    }
    
    @objc func playAnimation(_ sender: UIButton){
        if sender.titleLabel?.text == "START"{
            self.animationButton.setTitle("STOP", for: .normal)
            UnityPostMessage("GameObject", "PlayAnimation", "")
        }else{
            self.animationButton.setTitle("START", for: .normal)
            UnityPostMessage("GameObject", "StopAnimation", "")
        }
    }
    
    @IBAction func closeView(_ sender: Any) {
        self.hintView.removeFromSuperview()
        self.openCollections()
        UserDefaults.standard.set(true, forKey: "instructionsShowed")
        UserDefaults.standard.synchronize()
    }
    func showHintAlert(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.pausePlaying = true
        appDelegate.pauseSound()
        self.hintView.frame = self.view.frame
        self.hintSubView.clipsToBounds = true
        self.hintSubView.layer.cornerRadius = 5
        if self.view.frame.width == 320{
            self.hintHeight.constant = 350
            // self.hintSubView.layoutIfNeeded()
            self.hintView.layoutIfNeeded()
            
        }
        
        UIApplication.shared.keyWindow?.addSubview(self.hintView)
        
    }
    func enable_disableAllViews(status:Bool){
        
        self.unityView?.isUserInteractionEnabled = status
        self.openColl.isUserInteractionEnabled = status
        
    }
    
    //    @IBAction func stopUnity(sender: AnyObject) {
    //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //        appDelegate.stopUnity()
    //        unityView!.removeFromSuperview()
    //    }
    //    @IBAction func pushnew(_ sender: Any) {
    //        let vcc =  self.storyboard?.instantiateViewController(withIdentifier: "tempVC")
    //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //        self.navigationController?.pushViewController(vcc!, animated: true)
    //
    //    }
    //
    
}





