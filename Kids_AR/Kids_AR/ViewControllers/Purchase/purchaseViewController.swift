//
//  helpViewController.swift
//  Kids AR
//
//  Created by deemsys on 19/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import StoreKit


class productCell: UITableViewCell {
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var tile:UILabel!
    @IBOutlet weak var desc:UILabel!
    @IBOutlet weak var price:UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var purchased: UIImageView!
}



class purchaseViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    var alert:UIAlertView!
    
    @IBOutlet var restoreButton: UIButton!
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var contentList: UITableView!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var transactionInProgress = false 
    
    let store = IAPHelper()
    
    var buttonTAG:Int!
    
    var alertController:UIAlertController!
    
    override func viewDidLoad() {
        
        indicator.hidesWhenStopped = true
        
        restoreButton.layer.cornerRadius = 5;
        restoreButton.clipsToBounds = true;
        
        
        contentList.delegate = self
        contentList.dataSource = self
        
        contentList.tableFooterView = UIView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(purchaseViewController.handleNotification(_:)),
                                               name: IAPHelper.IAPProductNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(purchaseViewController.handleNotification(_:)),
                                               name: IAPHelper.IAPRestoreNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(purchaseViewController.handleNotification(_:)),
                                               name: IAPHelper.IAPTransactNotification,
                                               object: nil)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            self.indicator.startAnimating()
            if self.checkNetworkConnection() == true{
                self.store.requestProductInfo()
            }
        }
        
        
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//    
//        super.viewDidDisappear(true)
//        NotificationCenter.default.removeObserver(self, name: IAPHelper.IAPTransactNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: IAPHelper.IAPRestoreNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: IAPHelper.IAPProductNotification, object: nil)
//    }
    
    func checkNetworkConnection()->Bool{
        
        let R:Reachability = Reachability()
        
        if R.isConnectedToNetwork() == true {
            return true            
        } else {
            if self.indicator != nil{
                self.indicator.stopAnimating()
            }
            alertController = UIAlertController(title: "No Internet Connection!", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            return false;
        }
    }
    
    @IBAction func restoring(_ sender: Any) {
        // CHECK INTERNET CONNECTION
        if self.checkNetworkConnection() == false{
            return;
        }
        if(delegate.productsArray.count == 0){
            let alertView = UIAlertController(title: "Error!", message: "No products found. Kindly reload the page!", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertView, animated: true, completion: nil)
            
            self.view.isUserInteractionEnabled = true
            return
        }
        if !transactionInProgress{
            transactionInProgress = true
            self.indicator.startAnimating()
            store.restore()
        }
        else{
            let alertView = UIAlertController(title: "Warning!", message: "Please wait for the current transaction to be completed.", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertView, animated: true, completion: nil)
        }
    }
    
    @IBAction func backAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // TableView Delegates
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row%2 != 0{
            return 100
        }
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (delegate.productsArray.count)*2 // For space between cells
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row%2 != 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellProduct", for: indexPath as IndexPath) as! productCell
        
        let product = delegate.productsArray[Int(indexPath.row/2)]
        cell.tile.text = product?.localizedTitle
        cell.desc.text = product?.localizedDescription
        
        cell.buyButton.layer.cornerRadius = 5;
        cell.buyButton.clipsToBounds = true;
        
        cell.bgView.layer.cornerRadius = 5;
        cell.bgView.clipsToBounds = true;
            
            cell.buyButton.isHidden = false
            cell.purchased.isHidden = true
            
        let numberFormatter = NumberFormatter()
        numberFormatter.formatterBehavior = .behavior10_4
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = product?.priceLocale
        let price = numberFormatter.string(from: (product?.price)!)
        cell.price.text = price
        
        let purchased = UserDefaults.standard.bool(forKey: (product?.productIdentifier)!)
        if purchased{
            cell.buyButton.isHidden=true
            cell.purchased.isHidden = false
            
        }
        cell.buyButton.addTarget(self, action:#selector(buy(sender:)), for: .touchUpInside)
        cell.buyButton.tag = Int(indexPath.row/2)
        
        
        return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptycell", for: indexPath as IndexPath) as! productCell
            return cell
        }
    }
    @objc func buy(sender: UIButton){
        self.buttonTAG = sender.tag
        // CHECK INTERNET CONNECTION
        if self.checkNetworkConnection() == false{
            self.view.isUserInteractionEnabled = true
            return;
        }
        if !transactionInProgress{
            self.buttonTAG = sender.tag
            let product = delegate.productsArray[sender.tag]
            if product != nil{
                self.view.isUserInteractionEnabled = false
                self.transactionInProgress = true
                self.indicator.startAnimating()
                //  print("namr \(p.localizedTitle) namr \(p.price)")
                self.store.buy(p: product!)
            }
            else{
                print("product is empty")
            }
        }
        else{
            self.view.isUserInteractionEnabled = true
            let alertView = UIAlertController(title: "Warning!", message: "Please wait for the current transaction to be completed.", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertView, animated: true, completion: nil)
        }
    }
    
    
    // MARK: API Payment and In app purchase
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.store.emptyQueue()
        NotificationCenter.default.removeObserver(self)
    }
    
    func showActions(p:SKProduct) {
        if transactionInProgress {
            return
        }
        
        let actionSheetController = UIAlertController(title: p.localizedTitle, message: p.localizedDescription, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let buyAction = UIAlertAction(title: "Buy", style: UIAlertActionStyle.default) { (action) -> Void in
            self.view.isUserInteractionEnabled = false
            self.transactionInProgress = true
            self.indicator.startAnimating()
          //  print("namr \(p.localizedTitle) namr \(p.price)")
            self.store.buy(p: p)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) -> Void in
            
        }
        
        actionSheetController.addAction(buyAction)
        actionSheetController.addAction(cancelAction)
        
        present(actionSheetController, animated: true, completion: nil)
    }
    
    // Payment and product notifications
    @objc func handleNotification(_ notification: Notification) {
        switch notification.name {
        case IAPHelper.IAPProductNotification:
            self.view.isUserInteractionEnabled = true
            self.indicator.stopAnimating()
            if notification.userInfo!["message"] as! String == "success"{
                contentList.reloadData()
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
                
                
                var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 50, y: 10, width: 37, height: 37)) as UIActivityIndicatorView
                loadingIndicator.center = self.view.center;
                loadingIndicator.hidesWhenStopped = true
                loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
                loadingIndicator.startAnimating();
                
                self.alert.setValue(loadingIndicator, forKey: "accessoryView")
                loadingIndicator.startAnimating()
                
                if self.alert.isVisible == false{
                    self.alert.show();
                }
                self.loadReceipts()
                
            }
            else if notification.userInfo!["message"] as! String == "progress"{
                print("Progressing")
            }
            else{
                self.view.isUserInteractionEnabled = true
                transactionInProgress = false
                self.indicator.stopAnimating()
                contentList.reloadData()
            }
            
        case IAPHelper.IAPRestoreNotification:
//            transactionInProgress = false
//            self.view.isUserInteractionEnabled = true
//            self.indicator.stopAnimating()
//            contentList.reloadData()
            if notification.userInfo!["message"] as! String == "success"{
                self.alert = UIAlertView(title: "Verifying Purchase", message: "Please wait...", delegate: nil, cancelButtonTitle: nil);
                
                
                var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 50, y: 10, width: 37, height: 37)) as UIActivityIndicatorView
                loadingIndicator.center = self.view.center;
                loadingIndicator.hidesWhenStopped = true
                loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
                loadingIndicator.startAnimating();
                
                self.alert.setValue(loadingIndicator, forKey: "accessoryView")
                loadingIndicator.startAnimating()
                
                if self.alert.isVisible == false{
                    self.alert.show();
                }
                
                self.loadReceipts()
            }
        default:
            break
        }
        
        
        
        
    }
    func completePaymentWork(){
        DispatchQueue(label:"completePaymentWork").async {
            
            DispatchQueue.main.async {
                self.transactionInProgress = false
                self.view.isUserInteractionEnabled = true
                self.indicator.stopAnimating()
                self.contentList.reloadData()
                
            }
        }
    }
    func loadReceipts(){
        
        SwiftyStoreKit.fetchReceipt(forceRefresh: false) { result in
            switch result {
            case .success(let receiptData):
                let encryptedReceipt = receiptData.base64EncodedString(options: [])
                for product in self.delegate.productIDs{
                    let purchasedStatus = UserDefaults.standard.bool(forKey: product)
                    if purchasedStatus == true{
                        self.verifyReceipt(productid: product, encryptedData: encryptedReceipt)
                    }
                }
                print("Fetch receipt success:\n\(encryptedReceipt)")
            case .error(let error):
                print("Fetch receipt failed: \(error)")
            }
        }
        
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
                print("error calling POST on /verifyReceipt")
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with error \(error!.localizedDescription)"
                print(error!)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with internal error"
                return
            }
            if response.statusCode == 405{
                
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with server error"
                return
            }
            else if response.statusCode == 500{
                
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with server error"
                return
            }
            else if response.statusCode == 503{
                
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with server error"
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with empty response data"
                return
            }
            
            // parse the result as JSON, since that's what the API provides
            do {
                guard let receivedData = try JSONSerialization.jsonObject(with: responseData,
                                                                          options: []) as? [String: Any] else {
                                                                            print("Could not get JSON from responseData as dictionary")
                                                                            return
                }
                print("The Data is: " + receivedData.description)
                
                guard let statusStr = receivedData["status"] as? String else {
                    print("Could not get statusStr")
                    
                    msgTitle = "Error!"
                    msgDescription = "Receipt verification failed with invalid data"
                    return
                }
                print("The statusStr is: \(statusStr)")
                if statusStr == "success"{
                    msgTitle = "Success"
                    msgDescription = "Receipt verification done"
                    self.completePaymentWork()
                }else{
                    msgTitle = "Error!"
                    msgDescription = "Receipt verification failed"
                }
            } catch  {
                print("error parsing response from POST on /verifyReceipt")
                
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed with parsing error"
                return
            }
            if msgTitle == ""{
                msgTitle = "Error!"
                msgDescription = "Receipt verification failed"
            }
            self.alert.dismiss(withClickedButtonIndex: 0, animated: false)
            let alertView = UIAlertController(title: msgTitle, message: msgDescription, preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            if self.presentedViewController == nil {
                // do your presentation of the UIAlertController
                self.present(alertView, animated: true, completion: nil)
            } else {
                // either the Alert is already presented, or any other view controller
                // is active (e.g. a PopOver)
               
                let thePresentedVC : UIViewController? = self.presentedViewController as UIViewController?
                
                if thePresentedVC != nil {
                    if let thePresentedVCAsAlertController : UIAlertController = thePresentedVC as? UIAlertController {
                        // nothing to do , AlertController already active
                       // thePresentedVCAsAlertController.dismiss(animated: false, completion: nil)
                        print("Alert not necessary, already on the screen !")
                       // self.present(alertView, animated: true, completion: nil)
                        
                    } else {
                        // there is another ViewController presented
                        // but it is not an UIAlertController, so do
                        // your UIAlertController-Presentation with
                       
                        print("Alert comes up via another presented VC, e.g. a PopOver")
                    }
                }
            }
            
            
        }
        task.resume()
    }
}

