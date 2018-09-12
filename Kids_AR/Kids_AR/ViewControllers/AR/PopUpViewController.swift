//
//  PopUpViewController.swift
//  Kids_AR
//
//  Created by deemsys on 04/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import StoreKit

protocol popupDelegate {
    
    func didSelectModel(withName:String, audioName:String, modelID:String)
}

class PopUpViewController:UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var levelname: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    public var index:Int = 0
    var chapters:[String:Any] =  [:]
    public var isPasscodeSuccessful:Bool!
    
    var selectedIndexPath:Int = 0
    
    @IBOutlet var themeImage: UIImageView!
    @IBOutlet var menuView: UIView!
    @IBOutlet var colorView: UIView!
    var isPurchased:Bool =  false
    var delegate: popupDelegate?
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var transactionInProgress = false
    
    let store = IAPHelper()
    
    @IBOutlet var viewHeight: NSLayoutConstraint!
    @IBOutlet var viewWidth: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.isPasscodeSuccessful = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(purchaseViewController.handleNotification(_:)),
                                               name: IAPHelper.IAPProductNotification,
                                               object: nil) 
        NotificationCenter.default.addObserver(self, selector: #selector(purchaseViewController.handleNotification(_:)),
                                               name: IAPHelper.IAPTransactNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(pinSuccessful), name: NSNotification.Name(rawValue: "successLocker"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didCancelScreen), name: NSNotification.Name(rawValue: "cancelLocker"), object: nil)
        
        switch index+1 {
        case 1:
            // Alphabets
            self.themeImage.image = #imageLiteral(resourceName: "alphabets_theme")
            self.colorView.backgroundColor = UIColor.init(red: 57/255, green: 93/255, blue: 21/255, alpha: 0.5)
            
            break
        case 2:
            // animals
            self.themeImage.image = #imageLiteral(resourceName: "animals_theme")
            self.colorView.backgroundColor = UIColor.init(red: 124/255, green: 179/255, blue: 100/255, alpha: 0.5)
            break
        case 3:
            // fruits
            self.themeImage.image = #imageLiteral(resourceName: "veggs_theme")
            self.colorView.backgroundColor = UIColor.init(red: 158/255, green: 158/255, blue: 158/255, alpha: 0.5)
            break
        default:
            break
        }
        if  index+1 == 1 || index+1 == 3 {
            let purchased = UserDefaults.standard.bool(forKey: appdelegate.productIDs[0])
            if purchased{
                self.isPurchased = true
            }else{
                self.isPurchased = false
            }
        }
        else{
            let purchased = UserDefaults.standard.bool(forKey: appdelegate.productIDs[1])
            if purchased{
                self.isPurchased = true
            }else{
                self.isPurchased = false
            }
        }
        
        if self.isPurchased == false{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                
                if self.checkNetworkConnection(showAlert: false) == true{
                    self.store.requestProductInfo()
                }
            }
        }
        
        if UIDevice.current.model == "iPhone"{
            
            if self.view.frame.width == 320{
                viewWidth.constant = 300
                viewHeight.constant = 495
                self.menuView.layoutIfNeeded()
            }else{
                viewWidth.constant = 360
                viewHeight.constant = 595
                self.menuView.layoutIfNeeded()
                
            }
        }
        else{
            viewWidth.constant = 560
            viewHeight.constant = 795
            self.menuView.layoutIfNeeded()
        }
        self.view.isUserInteractionEnabled = true
        self.collectionView.reloadData()
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        
//        super.viewDidDisappear(true)
//        NotificationCenter.default.removeObserver(self, name: IAPHelper.IAPTransactNotification, object: nil) 
//        NotificationCenter.default.removeObserver(self, name: IAPHelper.IAPProductNotification, object: nil)
//    }
    deinit{
        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "successLocker"))
        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "cancelLocker"))
    }
    @objc func pinSuccessful() {
        print("Pop up VC - BUY")
        if self.isPasscodeSuccessful == true{
            return
        }
        if self.isPasscodeSuccessful == false{
            self.isPasscodeSuccessful = true
            self.view.isUserInteractionEnabled = false
            if self.index+1 == 1 || self.index+1 == 3{
                self.buy(itemIndex: 0)
            }else{
                self.buy(itemIndex: 1)
            }
        }
    }
    @objc  func didCancelScreen() {
        print("SCREEN CACNCELLED")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSONFile()
        
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()
        
        
    }
    
    func loadJSONFile(){
        if let path = Bundle.main.path(forResource: "kids", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [[String : Any]]{
                    let lchapters:[[String:Any]] = jsonResult
                    switch index+1 {
                    case 1:
                        // Alphabets
                        self.chapters = lchapters[0]
                        self.levelname.text = "Alphabets"
                        break
                    case 2:
                        // animals
                        self.chapters = lchapters[1]
                        self.levelname.text = "Animals"
                        break
                    case 3:
                        // fruits
                        self.chapters = lchapters[2]
                        self.levelname.text = "Fruits & Vegetables"
                        break
                    default:
                        break
                    }
                    self.collectionView.reloadData()
                }
                
                
            } catch {
                // handle error
                print("Error")
            }
        }
        
    }
    func checkNetworkConnection(showAlert:Bool)->Bool{
        
        let R:Reachability = Reachability()
        
        if R.isConnectedToNetwork() == true {
            return true
        } else {
            if showAlert == false{
                return false;
            }
          let  alertController = UIAlertController(title: "No Internet Connection!", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            return false;
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopUp(_ sender: AnyObject) {
        if transactionInProgress == false {
            self.removeAnimate()
            
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.pausePlaying = true
        appDelegate.pauseSound()
        //self.view.removeFromSuperview()
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
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 26
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionCell
        let model = self.chapters["models"] as! [[String:Any]]
        let itemValues = model[indexPath.row]
        cell.label.text = itemValues["modelName"] as! String
        cell.imageView.image = UIImage(named: itemValues["modelImage"] as! String)
        cell.imageView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        cell.lockIcon.isHidden = false
        if indexPath.row == 0 || indexPath.row == 1{
            cell.lockIcon.isHidden = true
        }
        else{
            if self.isPurchased == true{
                // purchased
                cell.lockIcon.isHidden = true
            }else{
                // not purchased
                cell.lockIcon.isHidden = false
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let model = self.chapters["models"] as! [[String:Any]]
        let itemValues = model[indexPath.row]
        
        if self.isPurchased  == true || indexPath.row == 0 || indexPath.row == 1{
            // purchased
            self.isPasscodeSuccessful = true
            self.removeAnimate()
            delegate?.didSelectModel(withName: itemValues["modelName"] as! String, audioName: itemValues["audioName"] as! String, modelID: itemValues["modelId"] as! String)
        }else{
            
            let alert:UIAlertController = UIAlertController(title: "Purchase", message: "Would you like to purchase this product?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
                
            }))
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                // MAKE PAYMENT
                
                self.selectedIndexPath = indexPath.row
                self.isPasscodeSuccessful = false
//                self.view.isUserInteractionEnabled = false
//                if self.index+1 == 1 || self.index+1 == 3{
//                    self.buy(itemIndex: 0)
//                }else{
//                    self.buy(itemIndex: 1)
//                }
                self.pin(.validate)
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func pin(_ mode: ALMode) {
        
        var appearance = ALAppearance()
        // appearance.title = "Set Parental Passcode"
        if mode == ALMode.validate{
            appearance.title = "Enter Parental Passcode"
        }else{
            appearance.title = "Set Parental Passcode"
        }
        
        appearance.isSensorsEnabled = false
        AppLocker.present(with: mode, and: appearance)
    }
    /*    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
     super.traitCollectionDidChange(previousTraitCollection)
     
     guard
     let previousTraitCollection = previousTraitCollection,
     self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass ||
     self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass
     else {
     return
     }
     
     self.collectionView?.collectionViewLayout.invalidateLayout()
     self.collectionView?.reloadData()
     }*/
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView?.collectionViewLayout.invalidateLayout()
        
        coordinator.animate(alongsideTransition: { context in
            
        }, completion: { context in
            self.collectionView?.collectionViewLayout.invalidateLayout()
            
            self.collectionView?.visibleCells.forEach { cell in
                guard let cell = cell as? collectionCell else {
                    return
                }
                cell.setCircularImageView()
            }
        })
    }
    
    
    /// PAYMENT INTEGRATION
    
    @objc func buy(itemIndex: Int){
        // CHECK INTERNET CONNECTION
        if self.checkNetworkConnection(showAlert: true) == false{
            self.view.isUserInteractionEnabled = true
            return;
        }
        if(appdelegate.productsArray.count == 0){
            self.view.isUserInteractionEnabled = true
            return
        }
        if !transactionInProgress{
            let product = appdelegate.productsArray[itemIndex]
            self.transactionInProgress = true
            self.store.buy(p: product!)
        }
        else{
            self.view.isUserInteractionEnabled = true
            let alertView = UIAlertController(title: "Warning!", message: "Please wait for the current transaction to be completed.", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertView, animated: true, completion: nil)
        }
    }
    
    
    // Payment and product notifications
    @objc func handleNotification(_ notification: Notification) {
        
        switch notification.name {
        case IAPHelper.IAPProductNotification:
            if notification.userInfo!["message"] as! String == "success"{
                print(appdelegate.productIDs)
                print(appdelegate.productsArray)
            }
            else if notification.userInfo!["message"] as! String == "incapable"{
                self.view.isUserInteractionEnabled = true
                let alertView = UIAlertController(title: "Error!", message: "Your device is not capable of making this purchase.", preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alertView, animated: true, completion: nil)
            }
            else{
                self.view.isUserInteractionEnabled = true
                let alertView = UIAlertController(title: "Error!", message: notification.userInfo?["message"] as? String, preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alertView, animated: true, completion: nil)
            }
        case IAPHelper.IAPTransactNotification:
            
            if notification.userInfo!["message"] as! String == "success"{
                transactionInProgress = false
                if  index+1 == 1 || index+1 == 3 {
                    let purchased = UserDefaults.standard.bool(forKey: appdelegate.productIDs[0])
                    if purchased{
                        self.isPurchased = true
                    }else{
                        self.isPurchased = false
                    }
                }
                else{
                    let purchased = UserDefaults.standard.bool(forKey: appdelegate.productIDs[1])
                    if purchased{
                        self.isPurchased = true
                    }else{
                        self.isPurchased = false
                    }
                }
                self.view.isUserInteractionEnabled = true
                self.collectionView.reloadData()
//                let model = self.chapters["models"] as! [[String:Any]]
//                let itemValues = model[self.selectedIndexPath]
//                self.removeAnimate()
//                delegate?.didSelectModel(withName: itemValues["modelName"] as! String, audioName: itemValues["audioName"] as! String, modelID: itemValues["modelId"] as! String)
            }
            else if notification.userInfo!["message"] as! String == "progress"{
                print("Progressing")
            }
            else{
                transactionInProgress = false
                self.view.isUserInteractionEnabled = true
                // self.indicator.stopAnimating()
                collectionView.reloadData()
            }
            
        default:
            break
        }
        
        
        
        
        
    }
}




