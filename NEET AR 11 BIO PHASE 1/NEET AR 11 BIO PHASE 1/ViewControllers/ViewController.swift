//
//  ARViewController.swift
//  NEET AR 11 BIO PHASE 1
//
//  Created by deemsys on 15/03/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

extension String {
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}

class ARViewController: UIViewController, ARSCNViewDelegate,UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var identity = CGAffineTransform.identity
    
    var item:[String:Any] = [:]
    var allmodels:[model] = []
    var modelname = ""
    var focusSquare = FocusSquare()
    var configuration : ARWorldTrackingConfiguration!
    
    var pinchGesture:UIPinchGestureRecognizer!
    var textManager:TextManager!
    
    var menuItems = [(name: String, uniqueid: String)]()
    
    var currentmodel:model!
    
    private var originalScale: SCNVector3?
    
    @IBOutlet var widthHintsView: NSLayoutConstraint!
    @IBOutlet var heightHintsView: NSLayoutConstraint!
    
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var hintsView: UIVisualEffectView!
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var resetButton: UIBarButtonItem!
    
    @IBOutlet weak var messagePanel: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet var blurView: UIView!
    
    var isSessionPaused = false
    var isPlaneSelected = false
    let planeHeight: CGFloat = 0.01
    
    var sceneNode: SCNNode!
    var partsSceneNode: SCNNode!
    var normalSceneNode: SCNNode!
    
    var animations = [String: CAAnimation]()
    var idle:Bool = true
    
    
    
    // MARK: - Queues
    let helper = DispatchQueue(label: "Helper")
    let serialQueue = DispatchQueue(label: "com.deemsysinc.ARDemoProject")
    
    
    // MARK:- Load
    func LoadFromJSON(finished: () -> Void) {
        helper.sync {
            self.allmodels = []
            var localmodel = model()
            localmodel.id = self.item["id"] as! Int
            localmodel.modelname = self.item["modelname"] as! String
            localmodel.modelpath = self.item["staticmodelpath"] as! String
            localmodel.staticmodelname = self.item["modelname"] as! String
            localmodel.staticmodelpath = self.item["staticmodelpath"] as! String
            localmodel.modelimage = self.item["modelimage"] as! String
            localmodel.visiblename = self.item["visiblename"] as! String
            localmodel.isSurfaceEnabled = self.item["isSurfaceEnabled"] as! Bool
            localmodel.isLighteningEnabled = self.item["isLighteningEnabled"] as! Bool
            localmodel.isZoomEnabled = self.item["isZoomEnabled"] as! Bool
            localmodel.isPartsAvailable = self.item["isPartsAvailable"] as! Bool
            localmodel.hints = self.item["hints"] as! [String]
            localmodel.partsname = ""
            localmodel.partsmodelpath = ""
            if localmodel.isPartsAvailable == true{
                localmodel.partsname = self.item["partsname"] as! String
                localmodel.partsmodelpath = self.item["partsmodelpath"] as! String
            }
            localmodel.showParts = false
            localmodel.scaleValue = self.item["scaleValue"] as! Float
            localmodel.canModifySurface = self.item["canModifySurface"] as! Bool
            localmodel.childModels = []
            
            
            
            if let subs = self.item["relatedmodels"] as? [[String:Any]]{
                
                for x in subs{
                    let submodel = model()
                    
                    submodel.id = x["id"] as! Int
                    submodel.modelname = x["modelname"] as! String
                    submodel.modelpath = x["staticmodelpath"] as! String
                    submodel.staticmodelname = x["modelname"] as! String
                    submodel.staticmodelpath = x["staticmodelpath"] as! String
                    submodel.modelimage = x["modelimage"] as! String
                    submodel.visiblename = x["visiblename"] as! String
                    submodel.isSurfaceEnabled = x["isSurfaceEnabled"] as! Bool
                    submodel.isLighteningEnabled = x["isLighteningEnabled"] as! Bool
                    submodel.isZoomEnabled = x["isZoomEnabled"] as! Bool
                    submodel.isPartsAvailable = x["isPartsAvailable"] as! Bool
                    submodel.hints = x["hints"] as! [String]
                    submodel.partsname = ""
                    submodel.partsmodelpath = ""
                    if submodel.isPartsAvailable == true{
                        submodel.partsname = x["partsname"] as! String
                        submodel.partsmodelpath = x["partsmodelpath"] as! String
                    }
                    submodel.scaleValue = x["scaleValue"] as! Float
                    submodel.canModifySurface = x["canModifySurface"] as! Bool
                    submodel.showParts = false
                    submodel.childModels = []
                    submodel.relatedids = x["relatedids"] as? [Int] ?? []
                    self.allmodels.append(submodel)
                    localmodel.relatedids.append(submodel.id)
                }
            }
            
            self.allmodels.insert(localmodel, at: 0)
            
            for index in 0..<self.allmodels.count{
                
                let tempmodel =  self.allmodels[index]
                
                for x in tempmodel.relatedids{
                    let filteredmodel =  self.allmodels.filter({ (xmodel) -> Bool in
                        return xmodel.id == x
                    })
                    if filteredmodel.count > 0 {
                        tempmodel.childModels = tempmodel.childModels + filteredmodel
                    }
                    
                    
                }
                
                self.allmodels.remove(at: index)
                self.allmodels.insert(tempmodel, at: index)
                
            }
            
            finished()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        messagePanel.layer.cornerRadius = 3.0
        messagePanel.clipsToBounds = true
        messagePanel.isHidden = true
        messageLabel.text = ""
        
        self.setupLayout()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        
        self.hintsViewSetup()
        
        self.LoadFromJSON {
          //  print("Loaded 3d model")
            configureLighting()
        }
        
        initializeSceneView()
        addTapGestureToSceneView()
        addPinchGestureToSceneView()
        configureLighting()
        initiateTracking()
        
        // Set the view's delegate
        sceneView.delegate = self
        //  sceneView.showsStatistics = true
        
        self.currentmodel = self.allmodels[0]
        self.items = self.createItems()
        self.currentPage = 0
        self.loadNormalModel()
        self.loadPartsModel()
        
        UserDefaults.standard.set(currentmodel.canModifySurface, forKey: "canModifySurface")
        UserDefaults.standard.set(currentmodel.isSurfaceEnabled, forKey: "isSurfaceEnabled")
        UserDefaults.standard.set(currentmodel.scaleValue, forKey: "scaleValue")
        UserDefaults.standard.set(currentmodel.isZoomEnabled, forKey: "shouldZoom")
        UserDefaults.standard.set(currentmodel.showParts, forKey: "showParts")
        if self.currentmodel.isPartsAvailable == false{
            UserDefaults.standard.set(false, forKey: "canshowParts")
        }else{
            UserDefaults.standard.set(true, forKey: "canshowParts")
        }
        UserDefaults.standard.synchronize()
        
    }
    func hintsViewSetup(){
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44.0;
        self.closeButton.layer.cornerRadius = 10.0;
        self.closeButton.layer.masksToBounds = true
        self.hintsView.layer.cornerRadius = 20.0;
        self.hintsView.layer.masksToBounds = true
        self.closeButton.layer.zPosition = 1
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //UIView Set up boarder
        self.hintsView.layer.borderColor = UIColor.lightText.cgColor;
        self.hintsView.layer.borderWidth = 2.0;
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        self.pauseSession()
        self.isSessionPaused = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        textManager = TextManager(viewController: self)
        
        if UserDefaults.standard.value(forKey: "isSurfaceEnabled") != nil{
            self.currentmodel.canModifySurface = UserDefaults.standard.value(forKey: "canModifySurface") as! Bool
            self.currentmodel.isSurfaceEnabled =  UserDefaults.standard.value(forKey: "isSurfaceEnabled") as! Bool
            self.currentmodel.scaleValue =   UserDefaults.standard.value(forKey: "scaleValue") as! Float
            self.currentmodel.scalePoints = SCNVector3(self.currentmodel.scaleValue,self.currentmodel.scaleValue,self.currentmodel.scaleValue)
            self.currentmodel.isZoomEnabled =  UserDefaults.standard.value(forKey: "shouldZoom") as! Bool
            self.currentmodel.showParts =  UserDefaults.standard.value(forKey: "showParts") as! Bool
        }
        
        if self.isSessionPaused == true{
            self.reset()
            configureLighting()
            initiateTracking()
            DispatchQueue.main.async {
                self.resetButton.isEnabled = false
                
            }
        }
        
        if textManager != nil{
            if self.messageLabel != nil && self.messagePanel != nil{
                self.messagePanel.isHidden = false
                self.messageLabel.isHidden = false
            }else{
              //  print("variable not available")
            }
            self.textManager.showMessage("Initializing AR Session", autoHide: false)
        }
        
        // Disable Restart button for a while in order to give the session enough time to restart.
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            self.resetButton.isEnabled  = true
        })
        
        
        if self.currentmodel.isSurfaceEnabled == true{
            focusSquare.hide()
        }
        else{
            setupFocusSquare()
        }
        
        
        // Show statistics such as fps and timing information
        
        
        if self.currentmodel.isAnimatable == true{
            loadAnimations ()
        }
        
        self.navigationItem.title = "\(self.currentmodel.visiblename)"
        
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK:- initializeSceneView
    func initializeSceneView() {
        // Set the view's delegate
        sceneView.delegate = self
        self.sceneView.isUserInteractionEnabled = false
        
        sceneView.antialiasingMode = .multisampling4X
        
        sceneView.scene = SCNScene()
        
        //  sceneView.autoenablesDefaultLighting = false
        
        // Add the SCNDebugOptions options
        // showConstraints, showLightExtents are SCNDebugOptions
        // showFeaturePoints and showWorldOrigin are ARSCNDebugOptions
        //           sceneView.debugOptions  = [SCNDebugOptions.showConstraints, ARSCNDebugOptions.showWorldOrigin]
        
        //shows fps rate
        //  sceneView.showsStatistics = false
        
        //  sceneView.automaticallyUpdatesLighting = false
    }
    
    func startSession() {
        configuration = ARWorldTrackingConfiguration()
        //currenly only planeDetection available is horizontal.
        configuration!.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
        sceneView.session.run(configuration!, options: [ARSession.RunOptions.removeExistingAnchors,
                                                        ARSession.RunOptions.resetTracking])
        
        
    }
    
    func pauseSession() {
        sceneView.session.pause()
    }
    
    func continueSession() {
        sceneView.session.run(configuration!)
    }
    
    // MARK:- Render Delegates
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Prevent the screen from being dimmed after a while.
        UIApplication.shared.isIdleTimerDisabled = true
        
        if !ARWorldTrackingConfiguration.isSupported {
            
            // This device does not support 6DOF world tracking.
            let sessionErrorMsg = "Unsupported platform! This app requires world tracking. World tracking is only available on iOS devices with A9 processor or newer. " +
            "Please quit the application."
            displayErrorMessage(title: Constants.alert.info.rawValue, message: sessionErrorMsg, allowRestart: false)
        }
    }
    func session(_ session: ARSession, didFailWithError error: Error) {
        guard let arError = error as? ARError else { return }
        
        let nsError = error as NSError
        var sessionErrorMsg = "\(nsError.localizedDescription) \(nsError.localizedFailureReason ?? "")"
        if let recoveryOptions = nsError.localizedRecoveryOptions {
            for option in recoveryOptions {
                sessionErrorMsg.append("\(option).")
            }
        }
        
        let isRecoverable = (arError.code == .worldTrackingFailed)
        if isRecoverable {
            sessionErrorMsg += "We're sorry!\nYou can try resetting the session or quit the application."
        } else {
            sessionErrorMsg += "We're sorry!\nThis is an unrecoverable error that requires to quit the application."
        }
        
        displayErrorMessage(title: Constants.alert.info.rawValue, message: sessionErrorMsg, allowRestart: isRecoverable)
    }
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        //   textManager.showTrackingQualityInfo(for: camera.trackingState, autoHide: true)
        
        switch camera.trackingState {
        case .notAvailable:
            break;
        case .limited(let reason):
            
            // cameraStatusLabel.text = "Limited with reason: "
            switch reason {
            case .excessiveMotion:
                textManager.escalateFeedback(for: camera.trackingState, inSeconds: 3.0)
                break
            //  cameraStatusLabel.text = cameraStatusLabel.text! + "excessive camera movement"
            case .insufficientFeatures:
                textManager.escalateFeedback(for: camera.trackingState, inSeconds: 3.0)
                break
            // cameraStatusLabel.text = cameraStatusLabel.text! + "insufficient features"
            case .initializing:
                textManager.escalateFeedback(for: camera.trackingState, inSeconds: 3.0)
                self.sceneView.isUserInteractionEnabled = false
            }
            
        case .normal:
            
            self.sceneView.isUserInteractionEnabled = true
            textManager.cancelScheduledMessage(forType: .trackingStateEscalation)
            if self.currentmodel.isSurfaceEnabled == false && checknodeexist() == false{
                
                if self.messageLabel != nil && self.messagePanel != nil{
                    self.messagePanel.isHidden = false
                    self.messageLabel.isHidden = false
                }else{
                  //  print("variable not available")
                }
                textManager.showMessage("Tap to place an object", autoHide: false)
                
            }
            else if self.currentmodel.isSurfaceEnabled == true && checknodeexist() == false{
                
                if self.messageLabel != nil && self.messagePanel != nil{
                    self.messagePanel.isHidden = false
                    self.messageLabel.isHidden = false
                }else{
                  //  print("variable not available")
                }
                textManager.showMessage("Move camera to plane surface and hold on until we detect the plane", autoHide: false)
            }
        }
    }
    func sessionWasInterrupted(_ session: ARSession) {
        //  textManager.blurBackground()
        textManager.showAlert(title: "Session Interrupted", message: "The session will be reset after the interruption has ended.")
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        //   textManager.unblurBackground()
        session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        self.resetButtonTapped(self)
        if self.messageLabel != nil && self.messagePanel != nil{
            self.messagePanel.isHidden = false
            self.messageLabel.isHidden = false
        }else{
           // print("variable not available")
        }
        textManager.showMessage("Resetting Session")
    }
    //    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
    //        switch camera.trackingState {
    //        case .normal:
    //         //   cameraStatusLabel.text = "Normal"
    //            self.sceneView.isUserInteractionEnabled = true
    //        case .notAvailable:
    //            break;
    //         //   cameraStatusLabel.text = "Not Available"
    //        case .limited(let reason):
    //           // cameraStatusLabel.text = "Limited with reason: "
    //            switch reason {
    //            case .excessiveMotion:
    //                break
    //              //  cameraStatusLabel.text = cameraStatusLabel.text! + "excessive camera movement"
    //            case .insufficientFeatures:
    //                break
    //               // cameraStatusLabel.text = cameraStatusLabel.text! + "insufficient features"
    //            case .initializing:
    //               // cameraStatusLabel.text = cameraStatusLabel.text! + "camera initializing in progress"
    //                self.sceneView.isUserInteractionEnabled = false
    //            }
    //
    //        }
    //    }
    //MARK: 3D Model animation
    
    func loadAnimations () {
        // Load the character in the idle animation
        let idleScene = SCNScene(named: self.currentmodel.modelpath)!
        
        // This node will be parent of all the animation models
        let node = SCNNode()
        node.isPaused = true
        // Add all the child nodes to the parent node
        for child in idleScene.rootNode.childNodes {
            node.addChildNode(child)
        }
        
        // Set up some properties
        node.position = SCNVector3(0, -1, -2)
        node.scale = self.currentmodel.scalePoints
        node.name = self.currentmodel.modelname
        self.sceneNode = node
        self.sceneNode.isPaused = true
        
        // Load all the DAE animations
        // loadAnimation(withKey: "dancing", sceneName: "art.scnassets/boy/twist_danceFixed", animationIdentifier: "twist_danceFixed-1")
        loadAnimation(withKey: "dancing", sceneName: self.currentmodel.modelAnimatedpath, animationId: self.currentmodel.animationIdentifier)
        //     print("loadAnimation(withKey: \"dancing\", sceneName: \(self.currentmodel.modelAnimatedpath), animationId: \(self.currentmodel.animationIdentifier))")
    }
    
    
    func loadAnimation(withKey: String, sceneName:String, animationId:String) {
        let sceneURL = Bundle.main.url(forResource: sceneName, withExtension: "dae")
        let sceneSource = SCNSceneSource(url: sceneURL!, options: nil)
        
        if let animationObject = sceneSource?.entryWithIdentifier(animationId, withClass: CAAnimation.self) {
            // The animation will only play once
            animationObject.repeatCount = 1
            // To create smooth transitions between animations
            animationObject.fadeInDuration = CGFloat(1)
            animationObject.fadeOutDuration = CGFloat(0.5)
            
            // Store the animation for later use
            animations[withKey] = animationObject
        }
    }
    func playAnimation(key: String) {
        // Add the animation to start playing it right away
        sceneView.scene.rootNode.name = self.currentmodel.modelname
        sceneView.scene.rootNode.addAnimation(animations[key]!, forKey: key)
        sceneView.scene.rootNode.isPaused = false
    }
    
    func stopAnimation(key: String) {
        // Stop the animation with a smooth transition
        sceneView.scene.rootNode.name = self.currentmodel.modelname
        sceneView.scene.rootNode.removeAnimation(forKey: key, blendOutDuration: CGFloat(0.5))
        sceneView.scene.rootNode.isPaused = true
    }
    
    
    func initiateTracking() {
        
        startSession()
    }
    
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
        self.sceneNode = nil
        self.hintsView.isHidden = true
        self.closeButton.isHidden = true
        DispatchQueue.main.async {
            self.resetButton.isEnabled = false
            
            self.textManager.cancelAllScheduledMessages()
            self.textManager.dismissPresentedAlert()
            if self.messageLabel != nil && self.messagePanel != nil{
                self.messagePanel.isHidden = false
                self.messageLabel.isHidden = false
            }else{
//                print("variable not available")
            }
            self.textManager.showMessage("Starting a new session")
            
            self.reset()
            self.configureLighting()
            self.initiateTracking()
            
            // Disable Restart button for a while in order to give the session enough time to restart.
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                self.resetButton.isEnabled  = true
            })
        }
        
        
    }
    
    
    //MARK:Session Actions
    @IBAction func goToHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        switch self.view.frame.width{
        case 320:
            self.widthHintsView.constant = 230
            self.heightHintsView.constant = 382
            self.hintsView.updateConstraints()
            self.hintsView.setNeedsLayout()
            break
        case 375:
            self.widthHintsView.constant = 289
            self.heightHintsView.constant = 481
            self.hintsView.updateConstraints()
            self.hintsView.setNeedsLayout()
            break
        case 414:
            self.widthHintsView.constant = 331
            self.heightHintsView.constant = 550
            self.hintsView.updateConstraints()
            self.hintsView.setNeedsLayout()
            break
            
        default:
            break
        }
    }
    
    @IBAction func showHelpView(_ sender: Any) {
        
        self.tableView.reloadData()
        self.closeButton.isHidden = false
        self.hintsView.fadeIn()
        
    }
    @IBAction func closeHelpView(_ sender: Any) {
        self.closeButton.isHidden = true
        self.hintsView.fadeOut()
        
    }
    func checknodeexist()->Bool{
        
        for cnode in sceneView.scene.rootNode.childNodes{
            
            let nodename = self.getOnlyModelName(name: cnode.name ?? "")
            
            if nodename == ""{
                continue
            }
            
            if nodename == self.currentmodel.staticmodelname || nodename == self.currentmodel.partsname{
                return true
            }
            
        }
        return false
    }
    
    func reset() {
        self.idle = true
        isSessionPaused = false
        isPlaneSelected = false
        //  anchors.removeAll()
        for node in sceneView.scene.rootNode.childNodes {
            node.removeFromParentNode()
        }
        // Show the focus square after a short delay to ensure all plane anchors have been deleted.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.setupFocusSquare()
            if self.currentmodel.isSurfaceEnabled == true{
                self.focusSquare.hide()
            }
            else{
                self.setupFocusSquare()
            }
            
            if self.currentmodel.isAnimatable == true{
                self.loadAnimations ()
            }
            
            self.navigationItem.title = "\(self.currentmodel.visiblename)"
        })
    }
    func configureLighting() {
        if self.currentmodel == nil {
            return
        }
       if(self.currentmodel.isLighteningEnabled == false){
        sceneView.autoenablesDefaultLighting = false
        sceneView.automaticallyUpdatesLighting = false
        
       }
       else{
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
        }
    }
    
    func add3D(x: Float = 0, y: Float = 0, z: Float = -0.5){
        //childNode(withName: self.currentmodel.modelname, recursively: true)
        //        guard let  scene = SCNScene(named: self.currentmodel.modelpath),
        //            let snode:SCNNode = scene.rootNode
        //
        //            else { return }
        var  snode:SCNNode!
        if self.currentmodel.modelname == self.currentmodel.staticmodelname{
            self.normalSceneNode.scale = self.currentmodel.scalePoints
            snode = self.normalSceneNode.clone()
        }
        else{
            self.partsSceneNode.scale = self.currentmodel.scalePoints
            snode = self.partsSceneNode.clone()
        }
        snode.name = self.currentmodel.modelname
        snode.scale = self.currentmodel.scalePoints
        self.sceneNode = snode
        // sceneNode.position = SCNVector3(x,y,z)
        sceneNode.position = SCNVector3Zero
        self.sceneNode.name = self.currentmodel.modelname
        sceneNode.scale = self.currentmodel.scalePoints
        //        sceneView.scene.rootNode.addChildNode(sceneNode)
    }
    //MARK: Gesture
    func addTapGestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture(sender:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    func addPinchGestureToSceneView() {
        
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(scale))
        pinchGesture.scale = 1.0;
        pinchGesture.delegate = self
        self.sceneView.addGestureRecognizer(pinchGesture)
    }
    //MARK: Methods
    func getOnlyModelName(name:String)->String{
        if name == ""{
            return ""
        }
        var nodename = String(describing: name)
        nodename = nodename.replacingOccurrences(of: "Optional(\"", with: "")
        nodename = nodename.replacingOccurrences(of: "\")", with: "")
        return nodename
    }
    
    private func node(at position: CGPoint) -> SCNNode? {
        var hitTestOptions = [SCNHitTestOption: Any]()
        hitTestOptions[SCNHitTestOption.boundingBoxOnly] = true
        
        let hitTestResults = sceneView.hitTest(position)
        if let node = hitTestResults.first?.node, self.getOnlyModelName(name: node.name ?? "") == self.currentmodel.modelname{
            return node
        }
        //        if sceneView.hitTest(position, options: hitTestOptions).first != nil{
        //            return sceneView.hitTest(position, options: hitTestOptions).first?.node
        //        }
        
        return sceneView.hitTest(position, options: hitTestOptions)
            .first(where: { self.getOnlyModelName(name: $0.node.name ?? "") == self.currentmodel.modelname})?
            .node
        
    }
    
    func getParent(_ nodeFound: SCNNode?) -> SCNNode? {
        if let node = nodeFound {
            if self.getOnlyModelName(name: node.name ?? "") == self.currentmodel.modelname {
                return node
            } else if let parent = node.parent {
                return getParent(parent)
            }
        }
        return nil
    }
    
    @objc func scale(_ gesture: UIPinchGestureRecognizer) {
        
        if self.currentmodel.isZoomEnabled == false{
            return
        }
        
        if self.hintsView.isHidden == false{
            return;
        }
        
        let location = gesture.location(in: sceneView)
        
        guard let node = node(at: location)else{return}
        
        //  print("node name \(node.name) \(self.sceneView.scene.rootNode.scale)")
        
        
        
        switch gesture.state {
        case .began:
            originalScale = node.scale
            if node.scale.x < 0.1{
                return
            }
            gesture.scale = CGFloat(node.scale.x)
        //    print("Begin:: \(originalScale)")
        case .changed:
            guard var originalScale = originalScale else { return }
            if gesture.scale > 2.0 || gesture.scale < 0.1{
                return
            }
            originalScale.x = Float(gesture.scale)
            originalScale.y = Float(gesture.scale)
            originalScale.z = Float(gesture.scale)
            node.scale = originalScale
        case .ended:
            
            guard var originalScale = originalScale else { return }
            if gesture.scale > 2.0 || gesture.scale < 0.1{
                return
            }
            originalScale.x = Float(gesture.scale)
            originalScale.y = Float(gesture.scale)
            originalScale.z = Float(gesture.scale)
            node.scale = originalScale
            gesture.scale = CGFloat(node.scale.x)
            
        default:
            gesture.scale = 1.0
            originalScale = nil
        }
        //        switch gesture.state {
        //        case .began:
        //            identity = firstImageView.transform
        //        case .changed,.ended:
        //            firstImageView.transform = identity.scaledBy(x: gesture.scale, y: gesture.scale)
        //        case .cancelled:
        //            break
        //        default:
        //            break
        //        }
        
    }
    func chooseMarkerFromAssest(name:String) -> String{
        if name == self.currentmodel.staticmodelname{
            return self.currentmodel.partsname
            
        }
        else{
            return self.currentmodel.staticmodelname
        }
    }
    func choosePathFromAssest(path:String) -> String{
        if path == self.currentmodel.staticmodelpath{
            return self.currentmodel.partsmodelpath
            
        }
        else{
            return self.currentmodel.staticmodelpath
        }
    }
    func getDirection(for point: CGPoint, in view: SCNView) -> SCNVector3 {
        let farPoint  = view.unprojectPoint(SCNVector3Make(Float(point.x), Float(point.y), 1))
        let nearPoint = view.unprojectPoint(SCNVector3Make(Float(point.x), Float(point.y), 0))
        
        return SCNVector3Make(farPoint.x - nearPoint.x, farPoint.y - nearPoint.y, farPoint.z - nearPoint.z)
    }
    
    func loadPartsModel(){
        if self.currentmodel.isPartsAvailable == false {
            self.partsSceneNode = nil
            return;
        }
        self.serialQueue.async {
            //            guard let  scene = SCNScene(named: self.currentmodel.partsmodelpath),
            //                let snode:SCNNode = scene.rootNode
            //
            //                else { return }
            guard let virtualObjectScene = SCNScene(named: self.currentmodel.partsmodelpath) else { return }
            self.partsSceneNode = SCNNode()
            for child in virtualObjectScene.rootNode.childNodes {
                self.partsSceneNode.addChildNode(child)
            }
            self.partsSceneNode.name = self.currentmodel.partsname
            self.partsSceneNode.scale = self.currentmodel.scalePoints
        }
        
    }
    func loadNormalModel(){
        
        self.serialQueue.async {
            //            guard let  scene = SCNScene(named: self.currentmodel.modelpath),
            //                let snode:SCNNode = scene.rootNode
            //
            //                else { return }
            guard let virtualObjectScene = SCNScene(named: self.currentmodel.staticmodelpath) else { return }
            self.normalSceneNode = SCNNode()
            for child in virtualObjectScene.rootNode.childNodes {
                self.normalSceneNode.addChildNode(child)
            }
            
            self.normalSceneNode.name = self.currentmodel.staticmodelname
            self.normalSceneNode.scale = self.currentmodel.scalePoints
        }
        
    }
    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
        
        if sender.state != .ended {
            return
        }
        
        if self.hintsView.isHidden == false{
            return;
        }
        
        textManager.showHideMessage(hide: true, animated: true)
        
        let tapLocation = sender.location(in: sceneView)
        /*  var selectednode:SCNNode!
         var selectednode_scale:SCNVector3!
         var selectednode_position:SCNVector3!
         var selectednode_transform:SCNMatrix4!
         /// Check if touched on node
         if let snode = self.node(at: tapLocation), self.currentmodel.isPartsAvailable == true{
         
         selectednode_position = self.sceneNode.convertPosition(snode.worldPosition, to: self.sceneNode)
         selectednode_transform = self.sceneNode.convertTransform(snode.worldTransform, to: self.sceneNode)
         
         
         selectednode = snode.clone()
         
         print("Selected node SCALE  \(self.sceneNode.scale)")
         print("Selected node position  \(snode.worldPosition)")
         
         self.resetallnodes()
         
         let modelname_for_marker = self.chooseMarkerFromAssest(name:self.currentmodel.modelname)
         let scenename_for_marker = self.choosePathFromAssest(path: self.currentmodel.modelpath)
         
         print(modelname_for_marker)
         print(scenename_for_marker)
         
         self.currentmodel.modelname = modelname_for_marker
         self.currentmodel.modelpath = scenename_for_marker
         self.currentmodel.scalePoints =  self.sceneNode.scale
         
         
         }
         else if let snode = self.node(at: tapLocation), self.currentmodel.isPartsAvailable == false{
         // node is available but no parts
         
         displayErrorMessage(title: Constants.alert.info.rawValue, message: "Parts are not available for this 3D model")
         }
         else{
         
         // Change model to normal view and place
         if self.currentmodel.modelname == self.currentmodel.partsname{
         let modelname_for_marker = self.chooseMarkerFromAssest(name:self.currentmodel.modelname)
         let scenename_for_marker = self.choosePathFromAssest(path: self.currentmodel.modelpath)
         self.currentmodel.modelname = modelname_for_marker
         self.currentmodel.modelpath = scenename_for_marker
         //                self.currentmodel.scalePoints = self.currentmodel.scalePoints
         }
         }
         
         
         // Check if object has to show marker
         if selectednode != nil{
         
         self.resetallnodes()
         
         if self.currentmodel.isAnimatable == true{
         // Add the node to the scene
         sceneNode.scale = self.currentmodel.scalePoints
         }else{
         // LOADED PREVIOUSLY
         self.add3D()
         
         }
         
         
         
         // Rotate Node
         sceneNode.worldPosition = selectednode_position
         sceneNode.transform = selectednode_transform
         self.sceneNode.scale = self.currentmodel.scalePoints
         self.sceneNode.name = self.currentmodel.modelname
         serialQueue.async {
         print("Repalce position \(self.sceneNode.worldPosition)")
         print("Repalce scale \(self.sceneNode.scale)")
         self.sceneView.scene.rootNode.addChildNode(self.sceneNode)
         selectednode.opacity = 0.0
         selectednode.removeFromParentNode()
         
         selectednode = nil
         selectednode_scale = nil
         selectednode_transform = nil
         selectednode_position = nil
         }
         
         
         
         
         
         return
         }
         */
        
        if self.currentmodel.showParts == true{
            //            let modelname_for_marker = self.chooseMarkerFromAssest(name:self.currentmodel.modelname)
            //            let scenename_for_marker = self.choosePathFromAssest(path: self.currentmodel.modelpath)
            self.currentmodel.modelname = self.currentmodel.partsname
            self.currentmodel.modelpath = self.currentmodel.partsmodelpath
        }else{
            self.currentmodel.modelname = self.currentmodel.staticmodelname
            self.currentmodel.modelpath = self.currentmodel.staticmodelpath
        }
        guard sceneView.session.currentFrame != nil else {
            return
        }
        
        guard let cameraTransform = sceneView.session.currentFrame?.camera.transform else {
            return
        }
        
        
        let hitResultsFeaturePoints: [ARHitTestResult]  = sceneView.hitTest(tapLocation, types: .featurePoint)
        
        if self.currentmodel.isSurfaceEnabled == true{
            
            focusSquare.hide()
            let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
            
            
            
            guard let hitTestResult = hitTestResults.first else {
                
                // No Nodes found, Play animation
                //                if self.currentmodel.isAnimatable == true
                //                {
                //                    var hitTestOptions = [SCNHitTestOption: Any]()
                //                    hitTestOptions[SCNHitTestOption.boundingBoxOnly] = true
                //
                //                    let hitResults: [SCNHitTestResult]  = sceneView.hitTest(tapLocation, options: hitTestOptions)
                //
                //                    if hitResults.first != nil {
                //                        if(idle) {
                //                            playAnimation(key: "dancing")
                //
                //                        } else {
                //                            stopAnimation(key: "dancing")
                //                        }
                //                        idle = !idle
                //                    }
                //
                //                }
                return
                
            }
            
            let position = hitTestResult.worldTransform
            
            
            
            let translation = hitTestResult.worldTransform.translation
            let x = translation.x
            let y = translation.y
            let z = translation.z
            
            
            let hit_tf=SCNMatrix4(hitTestResult.worldTransform)
            let new_pos=SCNVector3Make(hit_tf.m41, hit_tf.m42, hit_tf.m43)
            
            
            //            if self.currentmodel.isAnimatable == true{
            //
            //                // Add the node to the scene
            //                sceneNode.position = new_pos
            //                sceneNode.scale = self.currentmodel.scalePoints
            //                sceneNode.name = self.currentmodel.modelname
            //
            //
            //            }else{
            
            self.add3D(x: x, y: y, z: z)
            
            if self.sceneNode == nil{
                return
            }
            sceneNode.position = new_pos
            sceneNode.name = self.currentmodel.modelname
            sceneNode.scale = self.currentmodel.scalePoints
            
            //            }
            
            // Rotate to face towards camera
            if position != nil{
                // Trying to place object in place of focus square
                
                let cameraWorldPos = cameraTransform.translation
                var cameraToPosition = position.translation - cameraWorldPos
//                print(cameraToPosition)
//                print(simd_length(cameraToPosition))
                if simd_length(cameraToPosition) < 0.5 {
                    
                    let alertPrompt = UIAlertController(title: Constants.alert.info.rawValue, message: "Object is very near to the camera. Shall we reposition it to recommended distance?", preferredStyle: .alert)
                    let confirmAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                        self.resetallnodes()
                        if simd_length(cameraToPosition) < 0.5 {
                            cameraToPosition = simd_normalize(cameraToPosition)
                            cameraToPosition = cameraToPosition + float3(0.5,0.5,0.5)
                        }
                        let pos = cameraWorldPos + cameraToPosition
                        self.sceneNode.simdPosition = pos
                        // Rotate Node
                        let rotate = simd_float4x4(SCNMatrix4MakeRotation(self.sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
                        
                        let finalTransform = simd_mul(hitTestResult.worldTransform, rotate)
                        self.sceneNode.transform = SCNMatrix4(finalTransform)
                        self.sceneNode.scale = self.currentmodel.scalePoints
                        self.sceneNode.name = self.currentmodel.modelname
                        self.serialQueue.async {
                           // print("on surface scale \(self.sceneNode.scale)")
                            self.sceneView.scene.rootNode.addChildNode(self.sceneNode)
                        }
                        return
                        
                    })
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
                    
                    alertPrompt.addAction(confirmAction)
                    alertPrompt.addAction(cancelAction)
                    if let popoverController = alertPrompt.popoverPresentationController {
                        popoverController.sourceView = self.view
                        popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                        
                    }
                    self.present(alertPrompt, animated: true, completion: nil)
                    return;
                }
                
                self.resetallnodes()
                cameraToPosition = simd_normalize(cameraToPosition)
                
                let pos = cameraWorldPos + cameraToPosition
                sceneNode.simdPosition = pos
                
                // Rotate Node
                let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
                
                let finalTransform = simd_mul(hitTestResult.worldTransform, rotate)
                sceneNode.transform = SCNMatrix4(finalTransform)
                sceneNode.scale = self.currentmodel.scalePoints
                sceneNode.name = self.currentmodel.modelname
                serialQueue.async {
                 //   print("on surface far distance \(self.sceneNode.scale)")
                    self.sceneView.scene.rootNode.addChildNode(self.sceneNode)
                }
                return
            }
            else{
                // Place near by feature point
                self.resetallnodes()
                self.RotateObjectToCamera(hitResultsFeaturePoints:hitResultsFeaturePoints)
            }
            
            
            serialQueue.async {
//                print("scale of new model \(self.sceneNode.scale)")
                self.sceneView.scene.rootNode.addChildNode(self.sceneNode)
            }
        }
            
            
        else if self.currentmodel.isSurfaceEnabled == false {
            
            focusSquare.unhide()
            let position = focusSquare.lastPosition
            let hitTestResults = sceneView.hitTest(tapLocation)
            
            
            guard let node = hitTestResults.first?.node else {
                
                
                focusSquare.unhide()
                self.add3D()
                
                
                if self.sceneNode == nil{
                    return
                }
                
                // Rotate to face towards camera
                if position != nil{
                    // Trying to place object in place of focus square
                    
                    let cameraWorldPos = cameraTransform.translation
                    var cameraToPosition = float3(position!) - cameraWorldPos
//                    print(cameraToPosition)
                    if simd_length(cameraToPosition) < 0.5 {
                        
                        let alertPrompt = UIAlertController(title: Constants.alert.info.rawValue, message: "Object is very near to the camera. Shall we reposition it to recommended distance?", preferredStyle: .alert)
                        let confirmAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                            self.resetallnodes()
                            if simd_length(cameraToPosition) < 0.5  {
                                cameraToPosition = simd_normalize(cameraToPosition)
                                cameraToPosition = cameraToPosition + float3(0.5,0.5,0.5)
                            }
                            
                            let pos = cameraWorldPos + cameraToPosition
                            self.sceneNode.simdPosition = pos
                            
                            // Rotate Node
                            
                            self.sceneNode.transform = SCNMatrix4(self.focusSquare.simdTransform)
                            self.sceneNode.scale = self.currentmodel.scalePoints
                            self.sceneNode.name = self.currentmodel.modelname
                            self.serialQueue.async {
//                                print("on air of new model \(self.sceneNode.scale)")
                                self.sceneView.scene.rootNode.addChildNode(self.sceneNode)
                            }
                            return
                            
                        })
                        
                        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
                        
                        alertPrompt.addAction(confirmAction)
                        alertPrompt.addAction(cancelAction)
                        if let popoverController = alertPrompt.popoverPresentationController {
                            popoverController.sourceView = self.view
                            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                            
                        }
                        self.present(alertPrompt, animated: true, completion: nil)
                        return;
                    }
                    
                    self.resetallnodes()
                    cameraToPosition = simd_normalize(cameraToPosition)
                    
                    let pos = cameraWorldPos + cameraToPosition
                    sceneNode.simdPosition = pos
                    
                    // Rotate Node
                    
                    sceneNode.transform = SCNMatrix4(focusSquare.simdTransform)
                    sceneNode.scale = self.currentmodel.scalePoints
                    sceneNode.name = self.currentmodel.modelname
                    serialQueue.async {
//                        print("on air far of new model  scale \(self.sceneNode.scale)")
                        self.sceneView.scene.rootNode.addChildNode(self.sceneNode)
                    }
                    return;
                }
                else{
                    // Place near by feature point
                    self.resetallnodes()
                    self.RotateObjectToCamera(hitResultsFeaturePoints:hitResultsFeaturePoints)
                }
                
                return
            }
            
//            print("Node Found on tap\(node.name)")
            // Play animation on node selection
            //            if self.currentmodel.isAnimatable == true{
            //
            //                if(idle) {
            //                    playAnimation(key: "dancing")
            //                } else {
            //                    stopAnimation(key: "dancing")
            //                }
            //                idle = !idle
            //
            //            }
        }
        
        
    }
    func RotateObjectToCamera(hitResultsFeaturePoints:[ARHitTestResult],fsquare:SCNVector3=SCNVector3Zero){
        // Rotate to face towards camera
        if let hit = hitResultsFeaturePoints.first {
            
            if self.currentmodel.isSurfaceEnabled == false{
                
                if SCNVector3EqualToVector3(fsquare,SCNVector3Zero) == true{
                    // near by feature point
                    let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
                    
                    // Combine the matrices
                    let finalTransform = simd_mul(hit.worldTransform, rotate)
                    sceneView.session.add(anchor: ARAnchor(transform: finalTransform))
                }
            }
            else{
                // Rotate to face towards camera
                
                // Get the rotation matrix of the camera
                let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
                
                // Combine the matrices
                var finalTransform = simd_mul(hit.worldTransform, rotate)
                let scale = simd_float4x4(SCNMatrix4MakeScale(self.currentmodel.scaleValue,self.currentmodel.scaleValue,self.currentmodel.scaleValue))
                finalTransform = simd_mul(finalTransform, scale)
                sceneNode.simdTransform = finalTransform
            }
            
        }
    }
    func resetallnodes(){
        sceneView.scene.rootNode.childNodes.filter({ (cnode) -> Bool in
            
            var nodename = self.getOnlyModelName(name: cnode.name ?? "")
            
            //            if nodename == ""{
            //                return false
            //            }
            //
            if nodename == self.currentmodel.staticmodelname || nodename == self.currentmodel.partsname{
                // Place only one at a time
                cnode.removeFromParentNode()
            }
            return false
        })
        
    }
    var dragOnInfinitePlanesEnabled = false
    
    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        DispatchQueue.main.async {
            self.updateFocusSquare()
        }
    }
    
    
    func setupFocusSquare() {
        serialQueue.async {
            
            self.focusSquare.unhide()
            self.focusSquare.removeFromParentNode()
            self.focusSquare.name = "focussquare"
            if self.currentmodel.isSurfaceEnabled == false{
                self.sceneView.scene.rootNode.addChildNode(self.focusSquare)
                //  textManager.showMessage("Try moving left or right", autoHide: true)
                
            }
        }
        
    }
    
    func updateFocusSquare() {
        let (worldPosition, planeAnchor, _) = worldPositionFromScreenPosition(view.center, objectPos: focusSquare.position)
        if let worldPosition = worldPosition {
            self.serialQueue.async {
                self.focusSquare.update(for: worldPosition, planeAnchor: planeAnchor, camera: self.sceneView.session.currentFrame?.camera)
            }
        }
    }
    
    
    
    
    func worldPositionFromScreenPosition(_ position: CGPoint,
                                         objectPos: SCNVector3?,
                                         infinitePlane: Bool = false) -> (position: SCNVector3?, planeAnchor: ARPlaneAnchor?, hitAPlane: Bool) {
        
        // -------------------------------------------------------------------------------
        // 1. Always do a hit test against exisiting plane anchors first.
        //    (If any such anchors exist & only within their extents.)
        
        let planeHitTestResults = sceneView.hitTest(position, types: .existingPlaneUsingExtent)
        if let result = planeHitTestResults.first {
            
            let planeHitTestPosition = SCNVector3.positionFromTransform(result.worldTransform)
            let planeAnchor = result.anchor
            
            // Return immediately - this is the best possible outcome.
            return (planeHitTestPosition, planeAnchor as? ARPlaneAnchor, true)
        }
        
        // -------------------------------------------------------------------------------
        // 2. Collect more information about the environment by hit testing against
        //    the feature point cloud, but do not return the result yet.
        
        var featureHitTestPosition: SCNVector3?
        var highQualityFeatureHitTestResult = false
        
        let highQualityfeatureHitTestResults = sceneView.hitTestWithFeatures(position, coneOpeningAngleInDegrees: 18, minDistance: 0.2, maxDistance: 2.0)
        
        if !highQualityfeatureHitTestResults.isEmpty {
            let result = highQualityfeatureHitTestResults[0]
            featureHitTestPosition = result.position
            highQualityFeatureHitTestResult = true
        }
        
        // -------------------------------------------------------------------------------
        // 3. If desired or necessary (no good feature hit test result): Hit test
        //    against an infinite, horizontal plane (ignoring the real world).
        
        if (infinitePlane && dragOnInfinitePlanesEnabled) || !highQualityFeatureHitTestResult {
            
            let pointOnPlane = objectPos ?? SCNVector3Zero
            
            let pointOnInfinitePlane = sceneView.hitTestWithInfiniteHorizontalPlane(position, pointOnPlane)
            if pointOnInfinitePlane != nil {
                return (pointOnInfinitePlane, nil, true)
            }
        }
        
        // -------------------------------------------------------------------------------
        // 4. If available, return the result of the hit test against high quality
        //    features if the hit tests against infinite planes were skipped or no
        //    infinite plane was hit.
        
        if highQualityFeatureHitTestResult {
            return (featureHitTestPosition, nil, false)
        }
        
        // -------------------------------------------------------------------------------
        // 5. As a last resort, perform a second, unfiltered hit test against features.
        //    If there are no features in the scene, the result returned here will be nil.
        
        let unfilteredFeatureHitTestResults = sceneView.hitTestWithFeatures(position)
        if !unfilteredFeatureHitTestResults.isEmpty {
            let result = unfilteredFeatureHitTestResults[0]
            return (result.position, nil, false)
        }
        
        return (nil, nil, false)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // 1
        guard let planeAnchor = anchor as? ARPlaneAnchor else {
            
            // Anchor faced towards me
            
            DispatchQueue.main.async {
                if self.sceneNode != nil  {
                    let modelClone = self.sceneNode
                    
                    node.name = self.sceneNode.name
                    //                node.position = SCNVector3(0,0,-0.5)
                    // Add model as a child of the node
                    node.addChildNode(modelClone!)
                    
                }
            }
            return
        }
        
        // 2
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        let plane = SCNPlane(width: width, height: height)
        
        
        // 4
        let planeNode = SCNNode(geometry: plane)
        planeNode.name = "plane"
        node.name = "plane"
        // 5
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x,y,z)
        planeNode.eulerAngles.x = -.pi / 2
        //        let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
        //        let finalTransform = simd_mul(node.worldTransform, rotate)
        planeNode.opacity = 0.25
        
        // 6
        if self.currentmodel.isSurfaceEnabled == true{
            node.addChildNode(planeNode)
            
            if self.checknodeexist() == false{
                if self.messageLabel != nil && self.messagePanel != nil{
                    DispatchQueue.main.sync {
                        self.messagePanel.isHidden = false
                        self.messageLabel.isHidden = false
                        
                    }
                }else{
//                    print("variable not available")
                }
                textManager.showMessage("Plane Detected, Tap on the plane to place an object", autoHide: false)
            }
        }
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        // 1
        guard let planeAnchor = anchor as?  ARPlaneAnchor,
            let planeNode = node.childNodes.first,
            let plane = planeNode.geometry as? SCNPlane
            else { return }
        
        //        if self.checknodeexist() == true{
        //            return
        //        }
        
        // 2
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        plane.width = width
        plane.height = height
        
        // 3
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x, y, z)
    }
    
    
    fileprivate func createItems() -> [Character] {
        var characters:[Character] = []
        for x in self.currentmodel.childModels{
            let xchar = Character(imageName: x.modelimage, name:x.visiblename, subname:"")
            characters.append(xchar)
        }
        return characters
    }
    
    // MARK: - Card Collection Delegate & DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.identifier, for: indexPath) as! CarouselCollectionViewCell
        let character = items[(indexPath as NSIndexPath).row]
        cell.image.image = UIImage(named: character.imageName)
        cell.name.text = character.name
        //  cell.checkimage.image = #imageLiteral(resourceName: "unchecked")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let character = items[(indexPath as NSIndexPath).row]
        self.currentmodel = self.currentmodel.childModels[(indexPath as NSIndexPath).row]
        
        self.textManager.showMessage("Loading Model", autoHide: false)
        self.collectionView.isUserInteractionEnabled = false
        self.LoadFromJSON {
            let val = self.allmodels.filter { (smodel) -> Bool in
                if smodel.id == self.currentmodel.id{
                    return true
                }
                return false
            }
            if val.count == 1{
                self.currentmodel = val[0]
            }
            UserDefaults.standard.set(currentmodel.canModifySurface, forKey: "canModifySurface")
            UserDefaults.standard.set(currentmodel.isSurfaceEnabled, forKey: "isSurfaceEnabled")
            UserDefaults.standard.set(currentmodel.scaleValue, forKey: "scaleValue")
            UserDefaults.standard.set(currentmodel.isZoomEnabled, forKey: "shouldZoom")
            UserDefaults.standard.set(false, forKey: "showParts")
            if self.currentmodel.isPartsAvailable == false{
                UserDefaults.standard.set(false, forKey: "canshowParts")
            }else{
                UserDefaults.standard.set(true, forKey: "canshowParts")
            }
            UserDefaults.standard.synchronize()
            self.loadNormalModel()
            self.loadPartsModel()
            self.resetButtonTapped(self)
            self.items = self.createItems()
            self.currentPage = 0
            self.collectionView.performBatchUpdates({
                self.collectionView.collectionViewLayout.invalidateLayout()
                self.collectionView.reloadData()
                self.collectionView.isUserInteractionEnabled = true
            }) { (finished) in
                self.collectionView.collectionViewLayout.invalidateLayout()
                self.collectionView.reloadData()
                self.collectionView.isUserInteractionEnabled = true
            }
            self.textManager.showHideMessage(hide: true, animated: true)
        }
        
        
        
        
        
        
    }
    
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    
    
    fileprivate var items = [Character]()
    
    fileprivate var currentPage: Int = 0
    fileprivate func setupLayout() {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 30)
    }
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    fileprivate var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
}


extension ARViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentmodel.hints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "content") as! tableCell
        
        cell.tag = indexPath.row
        
        let item = self.currentmodel.hints[indexPath.row]
        cell.title.text = item
        
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: - Error handling
    
    func displayErrorMessage(title: String, message: String, allowRestart: Bool = false) {
        // Blur the background.
        //   textManager.blurBackground()
        
        if allowRestart {
            // Present an alert informing about the error that has occurred.
            let restartAction = UIAlertAction(title: "Reset", style: .default) { _ in
                //self.textManager.unblurBackground()
                self.resetButtonTapped(self)
            }
            textManager.showAlert(title: title, message: message, actions: [restartAction])
        } else {
            textManager.showAlert(title: title, message: message, actions: [])
        }
    }
}






