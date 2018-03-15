//
//  QRScannerController.swift
//  QRCodeReader
//
//  Created by Simon Ng on 13/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import AVFoundation

class QRScannerController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var hintsView: UIVisualEffectView!
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var widthHintsView: NSLayoutConstraint!
    @IBOutlet var heightHintsView: NSLayoutConstraint!
    
    var item:[String:Any]=[:]
    var hints:[String]=[]
    
    var captureSession = AVCaptureSession()
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                                      AVMetadataObject.ObjectType.code39,
                                      AVMetadataObject.ObjectType.code39Mod43,
                                      AVMetadataObject.ObjectType.code93,
                                      AVMetadataObject.ObjectType.code128,
                                      AVMetadataObject.ObjectType.ean8,
                                      AVMetadataObject.ObjectType.ean13,
                                      AVMetadataObject.ObjectType.aztec,
                                      AVMetadataObject.ObjectType.pdf417,
                                      AVMetadataObject.ObjectType.itf14,
                                      AVMetadataObject.ObjectType.dataMatrix,
                                      AVMetadataObject.ObjectType.interleaved2of5,
                                      AVMetadataObject.ObjectType.qr]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("called from QR DIDLOAD")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.hintsView.isHidden = true
        self.closeButton.isHidden = true
        
        
        
        self.hints = ["1. Move your phone towards QRCode",
                      "2. Hold on untill it detects the code",
                      "3. Make sure you scan the right code that belongs to the chosen model, otherwise you will end up with Invalid Code error",
                      "4. If everything successful, application will navigate to the Augmented View"
        ]
        
        hintsViewSetup()
        
        self.navigationController?.topViewController?.navigationItem.title = "\(self.item["visiblename"] as! String) Scan"
        
        
        
        // Get the back-facing camera for capturing videos
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: AVMediaType.video, position: .back)
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            print("Failed to get the camera device")
            return
        }
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session.
            captureSession.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            //            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            self.checkCameraStatus()
            return
        }
        
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        // Start video capture.
        
        
        // Move the message label and top bar to the front
        // view.bringSubview(toFront: messageLabel)
        
        
        
        // Initialize QR Code Frame to highlight the QR code
        qrCodeFrameView = UIView()
        
        if let qrCodeFrameView = qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            view.addSubview(qrCodeFrameView)
            view.bringSubview(toFront: qrCodeFrameView)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.checkCameraStatus()
        captureSession.startRunning()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        switch self.view.frame.width{
        case 320:
            self.widthHintsView.constant = 230
            self.heightHintsView.constant = 232
            self.hintsView.updateConstraints()
            self.hintsView.setNeedsLayout()
            break
        case 375:
            self.widthHintsView.constant = 289
            self.heightHintsView.constant = 331
            self.hintsView.updateConstraints()
            self.hintsView.setNeedsLayout()
            break
        case 414:
            self.widthHintsView.constant = 331
            self.heightHintsView.constant = 400
            self.hintsView.updateConstraints()
            self.hintsView.setNeedsLayout()
            break
            
        default:
            break
        }
    }
    
    // MARK: - Helper methods
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
    @IBAction func showHelpView(_ sender: Any) {
        self.view.bringSubview(toFront: hintsView)
        self.view.bringSubview(toFront: closeButton)
        self.tableView.reloadData()
        self.closeButton.isHidden = false
        self.hintsView.fadeIn()
        
    }
    @IBAction func closeHelpView(_ sender: Any) {
        self.closeButton.isHidden = true
        self.hintsView.fadeOut()
        
    }
    
    
    func launchApp(decodedString: String) {
        
        if presentedViewController != nil {
            return
        }
        
        if self.item["visiblename"] as! String != decodedString{
            let alertPrompt = UIAlertController(title: Constants.alert.info.rawValue, message: "Invalid QRCode", preferredStyle: .alert)
            
            
            let cancelAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.cancel, handler: nil)
            alertPrompt.addAction(cancelAction)
            
            present(alertPrompt, animated: true, completion: nil)
            return;
        }
        
        
        self.captureSession.stopRunning()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ARViewController") as! ARViewController
        vc.modelname = self.item["modelname"] as! String
        vc.item = self.item
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    // MARK: - Button Actions
    
    @IBAction func hintsShow(_ sender: Any) {
        
    }
    func showAlert(title: String, message: String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
//        alertController.addAction(UIAlertAction(title: "Settings", style: .default, handler: { (action) in
//            let url = NSURL(string: "app-settings:root=Privacy&path=Camera")! as URL
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }))
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    func checkCameraStatus(){
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        
        switch cameraAuthorizationStatus {
        case .denied:
            self.showAlert(title: Constants.alert.info.rawValue, message: "Please enable access to camera to continue using application")
            break
        case .authorized: break
        case .restricted: break
            
        case .notDetermined:
            // Prompting user for the permission to use the camera.
            AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
                if granted {
                    print("Granted access to \(cameraMediaType)")
                    
                } else {
                    self.showAlert(title: Constants.alert.info.rawValue, message: "Please enable access to camera to continue using application")
                    print("Denied access to \(cameraMediaType)")
                    
                }
            }
        }
    }
    
}

extension QRScannerController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "content") as! tableCell
        
        cell.tag = indexPath.row
        
        let item = self.hints[indexPath.row]
        cell.title.text = item
        
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}
extension QRScannerController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            //  messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type) {
            // If the found metadata is equal to the QR code metadata (or barcode) then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                launchApp(decodedString: metadataObj.stringValue!)
                // messageLabel.text = metadataObj.stringValue
            }
        }
    }
    
}

