//
//  augmentViewController.swift
//  Kids_AR
//
//  Created by deemsys on 01/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class augmentViewController: UIViewController, popupDelegate {
   
    
    
    var unityView: UIView?
    
    @IBOutlet var modeltitle: UILabel!
    
    @objc public var index:Int = 0
    
    
    
    var viewname:[String] = ["alphabetsScene","animalsScene","fruitsScene"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    func didSelectModel(withName: String, audioName: String, modelID: String) {
    
        
        let c = withName.characters.first!
        
        UnityPostMessage("GameObject", "loadAlphabet", "\(c)")
        
        
        
    }
    
    @IBAction func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func showAlphabet(_ sender: UIButton) {
      
        // collection view appears
        
        
    //    Toast.showPositiveMessage(message: "Collection view")
        
        let popOverVC = UIStoryboard(name: "UnityStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        popOverVC.index = self.index
         popOverVC.delegate = self
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
        
    }
    
    @IBAction func captureScreen(_ sender: Any) {
        
        UnityPostMessage("GameObject", "captureScreen", "")
    }
    
    @IBAction func playMusic(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.pauseSound()
        
        
        UnityPostMessage("GameObject", "playMusic", "")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            appDelegate.playSound()
        }
    }
    
    @objc  func startUnity() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.startUnity()
        
        unityView = UnityGetGLView()!
        
        
        
        
        if self.view == nil{
            print("self.view is not null")
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
        
        
        let speakerButton:UIButton = UIButton(type: .custom)
        speakerButton.backgroundColor = .clear
        speakerButton.setImage(#imageLiteral(resourceName: "speaker"), for: UIControlState.normal)
        speakerButton.addTarget(self, action:#selector(self.playMusic(_:)), for: .touchUpInside)
        self.view.addSubview(speakerButton)
        
        speakerButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        let cameraButton:UIButton = UIButton(type: .custom)
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
        
        
        let popOverVC = UIStoryboard(name: "UnityStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        popOverVC.index = self.index
        popOverVC.delegate = self
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
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


