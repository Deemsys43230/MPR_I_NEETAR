//
//  PopUpViewController.swift
//  Kids_AR
//
//  Created by deemsys on 04/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import StoreKit
import Firebase

protocol popupDelegate {
    
    func didSelectModel(withName:String, audioName:String, modelID:String)
}
extension Bundle {
    
    var appName: String {
        return infoDictionary?["CFBundleName"] as! String
    }
    
    var bundleId: String {
        return bundleIdentifier!
    }
    
    var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    var buildNumber: String {
        return infoDictionary?["CFBundleVersion"] as! String
    }
    
}
class PopUpViewController:UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var alert:UIAlertView!
    
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
//        self.isPasscodeSuccessful = false
//
//        NotificationCenter.default.addObserver(self, selector: #selector(purchaseViewController.handleNotification(_:)),
//                                               name: IAPHelper.IAPProductNotification,
//                                               object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(purchaseViewController.handleNotification(_:)),
//                                               name: IAPHelper.IAPTransactNotification,
//                                               object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(pinSuccessful), name: NSNotification.Name(rawValue: "successLocker"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(didCancelScreen), name: NSNotification.Name(rawValue: "cancelLocker"), object: nil)
//
//        switch index+1 {
//        case 1:
//            // Alphabets
//            self.themeImage.image = #imageLiteral(resourceName: "alphabets_theme")
//            self.colorView.backgroundColor = UIColor.init(red: 57/255, green: 93/255, blue: 21/255, alpha: 0.5)
//
//            break
//        case 2:
//            // animals
//            self.themeImage.image = #imageLiteral(resourceName: "animals_theme")
//            self.colorView.backgroundColor = UIColor.init(red: 124/255, green: 179/255, blue: 100/255, alpha: 0.5)
//            break
//        case 3:
//            // fruits
//            self.themeImage.image = #imageLiteral(resourceName: "veggs_theme")
//            self.colorView.backgroundColor = UIColor.init(red: 158/255, green: 158/255, blue: 158/255, alpha: 0.5)
//            break
//        default:
//            break
//        }
//        if  index+1 == 1 || index+1 == 3 {
//            let purchased = UserDefaults.standard.bool(forKey: appdelegate.productIDs[0])
//            if purchased{
//                self.isPurchased = true
//            }else{
//                self.isPurchased = false
//            }
//        }
//        else{
//            let purchased = UserDefaults.standard.bool(forKey: appdelegate.productIDs[1])
//            if purchased{
//                self.isPurchased = true
//            }else{
//                self.isPurchased = false
//            }
//        }
//
//        if self.isPurchased == false{
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
//
//                if self.checkNetworkConnection(showAlert: false) == true{
//                    self.store.requestProductInfo()
//                }
//            }
//        }
        
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
        self.store.emptyQueue()
        NotificationCenter.default.removeObserver(self)
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
        
        definesPresentationContext = true
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
     //   self.showAnimate()
        
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
//        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//        self.view.alpha = 0.0;
//        UIView.animate(withDuration: 0.25, animations: {
//            self.view.alpha = 1.0
//            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        });
    }
    
    func removeAnimate()
    {
       /* NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "successLocker"))
        NotificationCenter.default.removeObserver(NSNotification.Name(rawValue: "cancelLocker"))
        NotificationCenter.default.removeObserver(self)
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
                NotificationCenter.default.removeObserver(self)
            }
        }); */
        self.dismiss(animated: true, completion: nil)
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
        cell.label.text = (itemValues["modelName"] as! String)
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
        
        // Firebase events
        switch index+1 {
        case 1:
            Analytics.logEvent("AlphabetsModel_Tapped_iOS", parameters: nil)
            break
        case 2:
            Analytics.logEvent("AnimalsModel_Tapped_iOS", parameters: nil)
            break
        case 3:
            Analytics.logEvent("FruitsModel_Tapped_iOS", parameters: nil)
            break
        default:
            break
        }
        
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
                self.IAP_Cancel()
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
            let alertView = UIAlertController(title: "Error!", message: "No products found. Please relaunch the catalogue!", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertView, animated: true, completion: nil)
            
            self.view.isUserInteractionEnabled = true
            return
        }
        if !transactionInProgress{
            // Firebase events
            if (itemIndex == 0){
                 Analytics.logEvent("Alphabets_Iap_Start_iOS", parameters: nil)
            }else{
                Analytics.logEvent("Animals_Iap_Start_iOS", parameters: nil)
            }
            let product = appdelegate.productsArray[itemIndex]
            self.transactionInProgress = true
            self.store.buy(p: product!)
        }
        else{
            self.view.isUserInteractionEnabled = true
            let alertView = UIAlertController(title: "Warning!", message: "Please wait for the current transaction to complete.", preferredStyle: .alert)
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
                
                self.alert = UIAlertView(title: "Verifying Purchase", message: "Please wait...", delegate: nil, cancelButtonTitle: nil);
                
                let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 50, y: 10, width: 37, height: 37)) as UIActivityIndicatorView
                loadingIndicator.center = self.view.center;
                loadingIndicator.hidesWhenStopped = true
                loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
                loadingIndicator.startAnimating();
                
                self.alert.setValue(loadingIndicator, forKey: "accessoryView")
                loadingIndicator.startAnimating()
                
                self.alert.show();
                
                self.loadReceipts()
                
            }
            else if notification.userInfo!["message"] as! String == "User cancelled the transaction or Failure"{
                print("Failed")
                self.IAP_Fail()
            }
            else if notification.userInfo!["message"] as! String == ""{
                print("Progressing")
            }
                
            else{
                self.completePaymentWork()
            }
            
        default:
            break
        }
        
    }
    func completePaymentWork(){
        DispatchQueue(label:"completePaymentWork").async {
            
            DispatchQueue.main.async {
                self.transactionInProgress = false
                if  self.index+1 == 1 || self.index+1 == 3 {
                    let purchased = UserDefaults.standard.bool(forKey: self.appdelegate.productIDs[0])
                    if purchased{
                        self.isPurchased = true
                    }else{
                        self.isPurchased = false
                    }
                }
                else{
                    let purchased = UserDefaults.standard.bool(forKey: self.appdelegate.productIDs[1])
                    if purchased{
                        self.isPurchased = true
                    }else{
                        self.isPurchased = false
                    }
                }
                self.view.isUserInteractionEnabled = true
                self.collectionView.reloadData()
                
            }
        }
    }
    func loadReceipts(){
        
        SwiftyStoreKit.fetchReceipt(forceRefresh: false) { result in
            switch result {
            case .success(let receiptData):
                let encryptedReceipt = receiptData.base64EncodedString(options: [])
                if  self.index+1 == 1 || self.index+1 == 3 {
                    // Alphabets
                    self.verifyReceipt(productid: self.appdelegate.productIDs[0], encryptedData: encryptedReceipt)
                }else{
                    // Animals
                    self.verifyReceipt(productid: self.appdelegate.productIDs[1], encryptedData: encryptedReceipt)
                }
                
                print("Fetch receipt success:\n\(encryptedReceipt)")
            case .error(let error):
                self.IAP_Fail()
                let msgTitle = "Failed!"
                let msgDescription = "We are unable to verify your purchase"
                self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
                print("Fetch receipt failed: \(error)")
            }
        }
        
    }
    func dismissAndShowAlert(msgTitle:String, msgDescription:String){
        self.alert.dismiss(withClickedButtonIndex: 0, animated: false)
        completePaymentWork()
        let alertView = UIAlertController(title: msgTitle, message: msgDescription, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
    // MARK : API RECEIPT VERIFICATION
    
    
    
    func verifyReceipt(productid: String, encryptedData: String){
        let verifyEndpoint: String = Constants.receiptVerifyURL
        guard let verifyURL = URL(string: verifyEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        var verifyUrlRequest = URLRequest(url: verifyURL)
        verifyUrlRequest.httpMethod = "POST"
        let params: [String: Any] = ["receiptdata": encryptedData, "version": "\(Bundle.main.versionNumber)", "bundleid": "\(Bundle.main.bundleId)", "build": "\(Bundle.main.buildNumber)", "productid": productid]
        let jsonData: Data
        do {
            jsonData = try JSONSerialization.data(withJSONObject: params, options: [])
            verifyUrlRequest.httpBody = jsonData
        } catch {
            print("Error: cannot create JSON from Data")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: verifyUrlRequest) {
            (data, response, error) in
            
            var msgTitle = ""
            var msgDescription = ""
            
            guard error == nil else {
                self.IAP_Fail()
                print("error calling POST on /verifyReceipt")
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with error \(error!.localizedDescription) Please try later!"
                print(error!)
                self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                self.IAP_Fail()
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with internal error. Please try later!"
                self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
                return
            }
           if response.statusCode == 405{
            self.IAP_Fail()
            msgTitle = "Error!"
            msgDescription = "Receipt verification failed with server error. Please try later!"
            self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
                return
            }
           else if response.statusCode == 500{
            self.IAP_Fail()
            msgTitle = "Error!"
            msgDescription = "Receipt verification failed with server error. Please try later!"
            self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
            return
            }
           else if response.statusCode == 503{
            self.IAP_Fail()
            msgTitle = "Error!"
            msgDescription = "Receipt verification failed with server error. Please try later!"
            self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
            return
            }
           
            guard let responseData = data else {
                self.IAP_Fail()
                print("Error: did not receive data")
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed. Please try later!"
                self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
                return
            }
            
            // parse the result as JSON, since that's what the API provides
            do {
                guard let receivedData = try JSONSerialization.jsonObject(with: responseData,
                                                                          options: []) as? [String: Any] else {
                                                                            self.IAP_Fail()
                                                                            print("Could not get JSON from responseData as dictionary")
                                                                            return
                }
                print("The Data is: " + receivedData.description)
                
                guard let statusStr = receivedData["status"] as? String else {
                    print("Could not get statusStr")
                    self.IAP_Fail()
                    msgTitle = "Error!"
                    msgDescription = "Receipt verification failed with invalid data. Please try later!"
                    self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
                    return
                }
                print("The statusStr is: \(statusStr)")
                if statusStr == "success"{
                    self.IAP_Success()
                    msgTitle = "Success!"
                    msgDescription = "Your purchase is verified"
                    UserDefaults.standard.set(true, forKey: productid)
                    UserDefaults.standard.synchronize()
                    self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
                }else{
                    self.IAP_Fail()
                    msgTitle = "Failed!"
                    msgDescription = "We are unable to verify your purchase"
                    UserDefaults.standard.set(false, forKey: productid)
                    UserDefaults.standard.synchronize()
                    self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
                }
            } catch  {
                print("error parsing response from POST on /verifyReceipt")
                self.IAP_Fail()
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with parsing error. Please try later!"
                self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
                return
            }
            if msgTitle == ""{
                self.IAP_Fail()
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed"
                self.dismissAndShowAlert(msgTitle: msgTitle, msgDescription: msgDescription)
            }
        }
        task.resume()
    }
    
    // MARK: IAP_ANALYTICS
    
    func IAP_Fail(){
        if  self.index+1 == 1 || self.index+1 == 3 {
            // Alphabets
            Analytics.logEvent("Alphabets_Iap_Fail_iOS", parameters: nil)
        }else{
            // Animals
             Analytics.logEvent("Animals_Iap_Fail_iOS", parameters: nil)
        }
    }
    
    func IAP_Success(){
        if  self.index+1 == 1 || self.index+1 == 3 {
            // Alphabets
            Analytics.logEvent("Alphabets_Iap_Success_iOS", parameters: nil)
        }else{
            // Animals
            Analytics.logEvent("Animals_Iap_Success_iOS", parameters: nil)
        }
    }
    
    func IAP_Cancel(){
        if  self.index+1 == 1 || self.index+1 == 3 {
            // Alphabets
            Analytics.logEvent("Alphabets_Iap_Cancel_iOS", parameters: nil)
        }else{
            // Animals
            Analytics.logEvent("Animals_Iap_Cancel_iOS", parameters: nil)
        }
    }
    
}




