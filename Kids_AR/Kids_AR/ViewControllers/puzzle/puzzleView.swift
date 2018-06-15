//
//  puzzleView.swift
//  Kids_AR
//
//  Created by deemsys on 11/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import QuartzCore


class puzzleView : UIViewController, congratsDelegate{
    
    var positiveBeep: AVAudioPlayer?
    var negativeBeep: AVAudioPlayer?
    
    /// must be >= 1.0
    var snapX:CGFloat = 40.0
    
    /// must be >= 1.0
    var snapY:CGFloat = 1.0
    
    /// how far to move before dragging
    var threshold:CGFloat = 0.0
    
    /// the guy we're dragging
    var selectedView:UIView?
    
    /// drag in the Y direction?
    var shouldDragY = true
    
    /// drag in the X direction?
    var shouldDragX = true
    
    var answerTag = 0
    
    var index : Int = 0
    
    @IBOutlet var puzzletitle: UILabel!
    
    var chapters:[String:Any] =  [:]
    
   
    var originalPosition = CGPoint(x:0,y:0)
    
     @IBOutlet var dropBorderView: UIView!
    
     let speechSynthesizer = AVSpeechSynthesizer()
    
    @IBOutlet var backgroundImage: UIImageView!
    
    
    @IBOutlet var borderView1: UIView!
    @IBOutlet var borderView2: UIView!
    @IBOutlet var borderView3: UIView!
    @IBOutlet var borderView4: UIView!
    
    @IBOutlet var question: UILabel!
    
    @IBOutlet var dragView1: MyView!
    @IBOutlet var dragView2: MyView!
    @IBOutlet var dragView3: MyView!
    @IBOutlet var dragView4: MyView!
    
    @IBOutlet var dragImageView1: UIImageView!
    @IBOutlet var dragImageView2: UIImageView!
    @IBOutlet var dragImageView3: UIImageView!
    @IBOutlet var dragImageView4: UIImageView!
    
    @IBOutlet var dropView: UIView!
    
    @IBOutlet var topConstraint: NSLayoutConstraint!
     @IBOutlet var heightCons: NSLayoutConstraint!
    @IBOutlet var widthCons: NSLayoutConstraint!
    
    @IBOutlet var dropheightCons: NSLayoutConstraint!
    @IBOutlet var dropwidthCons: NSLayoutConstraint!
     @IBOutlet var centerXRight: NSLayoutConstraint!
    @IBOutlet var centerXLeft: NSLayoutConstraint!
    
    var answerIndex = 0
    var otherIndex1 = 0
    var otherIndex2 = 0
    var otherIndex3 = 0
    
    var alphabets = ["A","B","C","D","E","F","G","H","I","J","K","L","K","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.index == 0{
            self.puzzletitle.text = "Fruits & Vegetables"
            self.backgroundImage.image = #imageLiteral(resourceName: "bg")
        }else{
            self.puzzletitle.text = "Animals"
            self.backgroundImage.image = #imageLiteral(resourceName: "bg2")
        }
        
        positiveBeep = setupAudioPlayer(withFile: "positiveTone")
        negativeBeep = setupAudioPlayer(withFile: "negativeTone")
        
        borderView1.clipsToBounds = true
        borderView1.layer.cornerRadius = 10
        dragView1.clipsToBounds = true
        dragView1.layer.cornerRadius = 10
        
        borderView2.clipsToBounds = true
        borderView2.layer.cornerRadius = 10
        dragView2.clipsToBounds = true
        dragView2.layer.cornerRadius = 10
        
        borderView3.clipsToBounds = true
        borderView3.layer.cornerRadius = 10
        dragView3.clipsToBounds = true
        dragView3.layer.cornerRadius = 10
        
        borderView4.clipsToBounds = true
        borderView4.layer.cornerRadius = 10
        dragView4.clipsToBounds = true
        dragView4.layer.cornerRadius = 10
        
        dropBorderView.clipsToBounds = true
        dropBorderView.layer.cornerRadius = 10
        dropView.clipsToBounds = true
        dropView.layer.cornerRadius = 10
        
        
        self.dropView.isUserInteractionEnabled = false
        setupGestures()
         loadJSONFile()
    }
    
    @IBOutlet var puzzlebannertop: NSLayoutConstraint!
    
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    override func viewWillLayoutSubviews() {
        
        if UIDevice.current.model == "iPhone"{
            
            if self.view.frame.width == 320{
                self.puzzlebannertop.constant = 15
                self.topConstraint.constant = 20
                self.bottomConstraint.constant = 20
                self.widthCons.constant = 100
                self.heightCons.constant = 100
                self.dropwidthCons.constant = 130
                self.dropheightCons.constant = 130
                self.centerXLeft.constant = -75
               self.centerXRight.constant = 75
                self.view.layoutIfNeeded()
                self.dropView.superview?.layoutIfNeeded()
                self.dropView.superview?.setNeedsLayout()
                self.dragView1.layoutIfNeeded()
                self.dragView1.superview?.setNeedsLayout()
                self.dragView2.layoutIfNeeded()
                self.dragView2.superview?.setNeedsLayout()
                self.dragView3.layoutIfNeeded()
                self.dragView3.superview?.setNeedsLayout()
                self.dragView4.layoutIfNeeded()
                self.dragView4.superview?.setNeedsLayout()
           
            }
            }
//                else{
//                topConstraint.constant = 55
//                widthCons.constant = 120
//                heightCons.constant = 120
//                dropwidthCons.constant = 180
//                dropheightCons.constant = 180
//                centerXRight.constant = 80
//                centerXLeft.constant = -80
//                self.view.layoutIfNeeded()
//
//            }
   
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    func setupGestures() {
        let pan = UIPanGestureRecognizer(target:self, action:#selector(self.pan(_:)))
        pan.maximumNumberOfTouches = 1
        pan.minimumNumberOfTouches = 1
        self.view.addGestureRecognizer(pan)
    }
    
    @objc func pan(_ rec:UIPanGestureRecognizer) {
        
        let p:CGPoint = rec.location(in: self.view)
        var center:CGPoint = .zero
        
        switch rec.state {
        case .began:
            print("began")
            let hitView = view.hitTest(p, with: nil)
            
            if hitView == self.dropView || !(hitView is MyView){
                print(self.dropView .center)
                return
            }
            else if hitView is MyView{
                selectedView = hitView
                selectedView?.tag = (hitView?.tag)!
                originalPosition = (hitView?.center)!
            }
            if selectedView != nil{
                
                self.view.bringSubview(toFront: selectedView!)
            }
            
        case .changed:
            if let subview = selectedView {
                center = subview.center
                let distance = sqrt(pow((center.x - p.x), 2.0) + pow((center.y - p.y), 2.0))
                print("distance \(distance) threshold \(threshold)")
                
                if subview is MyView {
                    if distance > threshold {
                        if shouldDragX {
                            subview.center.x = p.x - (p.x.truncatingRemainder(dividingBy: snapX))
                        }
                        if shouldDragY {
                            subview.center.y = p.y - (p.y.truncatingRemainder(dividingBy: snapY))
                        }
                    }
                }
            }
            
        case .ended:
            print("ended")
            if let subview = selectedView {
                //                if subview is MyView {
                //                    // do whatever
                //                }
                if self.dropView.frame.contains(p) && selectedView?.tag == answerTag{
                    print("location in target")
                    self.dropView.expand(into: self.view, finished: nil)
                    showCongrats()
                }else{
                    print("back to original")
                    if self.dropView.frame.contains(p){
                        playSound(type: false)
                    }
                    
                    self.dropView.tada(nil)                    
                    selectedView?.center = originalPosition
                    
                }
                
            }
            selectedView = nil
            
        case .possible:
            print("possible")
        case .cancelled:
            print("cancelled")
            selectedView = nil
        case .failed:
            print("failed")
            selectedView = nil
        }
    }
    func playSound(type:Bool){
        if type{
//            // positive Sound
//            positiveBeep?.play()
        }
        else{
            // negative sound
            negativeBeep?.play()
        }
    }
    func setupAudioPlayer(withFile file: String) -> AVAudioPlayer? {
        guard  let path  = Bundle.main.url(forResource: file, withExtension: "mp3") else{return nil}
        do {
            let mplayer = try AVAudioPlayer(contentsOf: path, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player:AVAudioPlayer = mplayer else { return nil}
            player.numberOfLoops = 1
            player.volume = 1.0
            return player
            
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func loadJSONFile(){
        if let path = Bundle.main.path(forResource: "kids", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [[String : Any]]{
                    let lchapters:[[String:Any]] = jsonResult
                    switch index+1 {
                    
                    case 2:
                        // animals
                        self.chapters = lchapters[1]
                        break
                    case 1:
                        // fruits
                        self.chapters = lchapters[2]
                        break
                    default:
                        break
                    }
                    self.makeRandom()
                }
                
                
            } catch {
                // handle error
                print("Error")
            }
        }
        
    }
    func showCongrats() {
        
       
            
            let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "congratsView") as! congratsView
//            popOverVC.index = self.index
            popOverVC.delegate = self
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
        
    }
    func makeRandom(){
         answerIndex = Int((arc4random()%26))
         otherIndex1 = 0
         otherIndex2 = 0
         otherIndex3 = 0
        
       self.answerTag = Int((arc4random()%4)+1);
        var nums = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
       nums.remove(at: answerIndex)
        for i in 0..<3 {
            
            // random key from array
            let arrayKey = Int(arc4random_uniform(UInt32(nums.count)))
            
            
            // your random number
            let randNum = nums[arrayKey]
            
            if i == 0{
                otherIndex1 = randNum
            }
            else if i == 1{
                otherIndex2 = randNum
            }
            else if i == 2{
                otherIndex3 = randNum
            }
            
            // make sure the number isnt repeated
            nums.remove(at: arrayKey)
        }
        self.applyRandomToView()
    }
    func applyRandomToView(){
        let model = self.chapters["models"] as! [[String:Any]]
        var aItem = model[self.answerIndex]
        let name = aItem["modelName"] as! String
        self.question.text = "FIND " + "\(name)"
        var bITem = model[self.otherIndex1]
        var cITem = model[self.otherIndex2]
        var dITem = model[self.otherIndex3]
        switch answerTag {
        case 1:
            self.dragImageView1.image = UIImage(named: aItem["modelImage"] as! String)
            self.dragImageView2.image = UIImage(named: bITem["modelImage"] as! String)
            self.dragImageView3.image = UIImage(named: cITem["modelImage"] as! String)
            self.dragImageView4.image = UIImage(named: dITem["modelImage"] as! String)
            break
        case 2:
            self.dragImageView2.image = UIImage(named: aItem["modelImage"] as! String)
            self.dragImageView1.image = UIImage(named: bITem["modelImage"] as! String)
            self.dragImageView3.image = UIImage(named: cITem["modelImage"] as! String)
            self.dragImageView4.image = UIImage(named: dITem["modelImage"] as! String)
            break;
        case 3:
            self.dragImageView3.image = UIImage(named: aItem["modelImage"] as! String)
            self.dragImageView2.image = UIImage(named: bITem["modelImage"] as! String)
            self.dragImageView1.image = UIImage(named: cITem["modelImage"] as! String)
            self.dragImageView4.image = UIImage(named: dITem["modelImage"] as! String)
            break;
        case 4:
            self.dragImageView4.image = UIImage(named: aItem["modelImage"] as! String)
            self.dragImageView2.image = UIImage(named: bITem["modelImage"] as! String)
            self.dragImageView3.image = UIImage(named: cITem["modelImage"] as! String)
            self.dragImageView1.image = UIImage(named: dITem["modelImage"] as! String)
            break
        default:
            break
        }
        
     //   DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            if !self.speechSynthesizer.isSpeaking {
                let speechUtterance = AVSpeechUtterance(string: "\(self.question.text!)")
                self.speechSynthesizer.speak(speechUtterance)
            }
            else{
                self.speechSynthesizer.continueSpeaking()
            }
      //  }
    }
    
    @IBAction func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func nextQuestion() {
        self.makeRandom()
    }
}
