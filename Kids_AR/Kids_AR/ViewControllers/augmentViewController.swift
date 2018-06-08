//
//  augmentViewController.swift
//  Kids_AR
//
//  Created by deemsys on 01/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class augmentViewController: UIViewController, popupDelegate {
    
    @IBOutlet var hintView: UIView!
    @IBOutlet var hintSubView: UIView!
    var unityView: UIView?
    
    @IBOutlet var modeltitle: UILabel!
    
    @objc public var index:Int = 0
    
    var speakerButton:UIButton!
 var cameraButton:UIButton!
    
    var viewname:[String] = ["alphabetsScene","animalsScene","fruitsScene"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showButtons(notfication:)), name: .postNotifi, object: nil)
        
        
        if index == 0{
            self.modeltitle.text = "Alphabets"
        }
        else if index == 1{
            self.modeltitle.text = "Animals"
        }
        else if index == 2{
            self.modeltitle.text = "Fruits & Vegetables"
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
    }
    
    
    @objc func showButtons(notfication: NSNotification) {
        if self.cameraButton.isHidden == true {
            self.cameraButton.isHidden = false
        }
        if self.speakerButton.isHidden == true {
            self.speakerButton.isHidden = false
        }
    }
    
    
    
    func didSelectModel(withName: String, audioName: String, modelID: String) {
        self.cameraButton.isHidden = true
        self.speakerButton.isHidden = true
        
        let c = withName.characters.first!
        UnityPostMessage("GameObject", "loadAlphabet", "\(c)")
        var val = UserDefaults.standard.value(forKey: "rateus") as! Int
        val = val + 1
        if val == 4 || val == 8 || val == 12{
            // Show rate us alert
            let alert:UIAlertController = UIAlertController(title: "Rate us", message: "Hope you enjoyed using our app! Would you like to rate us?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: Constants.alert.ok.rawValue, style: .default, handler: { (action) in
                // redirect to appstore
                settingsViewController().openUrl("itms-apps://itunes.apple.com/us/app/kids-alphabets-ar/id1387392682?ls=1&mt=8")
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
        
        // print(AVAudioSession.sharedInstance().outputVolume)
        
        if  AVAudioSession.sharedInstance().outputVolume == 0  {
            Toast.showNegativeMessage(message: "For the application to work correctly, you must increase 'Media Volume'. If you did not, you can not hear the music.")
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.pauseSound()
        
        
        UnityPostMessage("GameObject", "playMusic", "")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            appDelegate.playSound()
        }
    }
    
    @objc  func startUnity() {
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let topController = UIApplication.topViewController(), !(topController is augmentViewController) {
            return
        }
        
        appDelegate.startUnity()
        
        unityView = UnityGetGLView()!
        
        
        
        
        if self.view == nil{
            print("self.view is null")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.startUnity()
            }
        }
        self.view!.addSubview(unityView!)
        unityView!.translatesAutoresizingMaskIntoConstraints = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 ) {
            
            UnityPostMessage("GameObject", "restartMentionedScene", self.viewname[self.index])
        }
        
        // look, non-full screen unity content!
        let views = ["view": unityView]
        let w = NSLayoutConstraint.constraints(withVisualFormat: "|-0-[view]-0-|", options: [], metrics: nil, views: views)
        let h = NSLayoutConstraint.constraints(withVisualFormat: "V:|-70-[view]-0-|", options: [], metrics: nil, views: views)
        view.addConstraints(w + h)
        
        
        speakerButton = UIButton(type: .custom)
        speakerButton.backgroundColor = .clear
        speakerButton.setImage(#imageLiteral(resourceName: "speaker"), for: UIControlState.normal)
        speakerButton.addTarget(self, action:#selector(self.playMusic(_:)), for: .touchUpInside)
        self.view.addSubview(speakerButton)
        
        speakerButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        cameraButton = UIButton(type: .custom)
        cameraButton.backgroundColor = .clear
        cameraButton.setImage(#imageLiteral(resourceName: "camera"), for: UIControlState.normal)
        cameraButton.addTarget(self, action:#selector(self.captureScreen(_:)), for: .touchUpInside)
        self.view.addSubview(cameraButton)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cameraButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -50),
            cameraButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            cameraButton.widthAnchor.constraint(equalToConstant: 50),
            cameraButton.heightAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate([
            speakerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 50),
            speakerButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            speakerButton.widthAnchor.constraint(equalToConstant: 50),
            speakerButton.heightAnchor.constraint(equalToConstant: 50)])
        
        self.cameraButton.isHidden = true
        self.speakerButton.isHidden = true
        
        
        let instructionsShowed = UserDefaults.standard.value(forKey: "instructionsShowed") as! Bool
        
        
        if instructionsShowed == true{
            
            self.openCollections()
        }
        else{
            showHintAlert()
           /*let alert:UIAlertController = UIAlertController(title: "Info", message: "Point your device to a surface with detailed texture.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Constants.alert.ok.rawValue, style: .default, handler: { (action) in
                // Collections  show
                
            }))
            self.present(alert, animated: true, completion: nil)*/
            
        }
    }
    
    @IBAction func closeView(_ sender: Any) {
            self.hintView.removeFromSuperview()
        self.openCollections()
        UserDefaults.standard.set(true, forKey: "instructionsShowed")
        UserDefaults.standard.synchronize()
    }
    func showHintAlert(){
        self.hintView.frame = self.view.frame
        self.hintSubView.clipsToBounds = true
        self.hintSubView.layer.cornerRadius = 5
        
        UIApplication.shared.keyWindow?.addSubview(self.hintView)
         
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


extension Notification.Name {
    static let postNotifi = Notification.Name("UnityObjectPlaced")
}


