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
    
    
    @IBOutlet var restoreButton: UIButton!
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var contentList: UITableView!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var transactionInProgress = false 
    
    let store = IAPHelper()
    
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
        if !transactionInProgress{
            transactionInProgress = true
            self.indicator.startAnimating()
            store.restore()
        }
        else{
            let alertView = UIAlertController(title: "Warning!", message: "Please wait for the current transaction get complete.", preferredStyle: .alert)
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
        // CHECK INTERNET CONNECTION
        if self.checkNetworkConnection() == false{
            return;
        }
        if !transactionInProgress{
            let product = delegate.productsArray[sender.tag]
            if product != nil{
                showActions(p: product!)
            }
            else{
                print("product is empty")
            }
        }
        else{
            let alertView = UIAlertController(title: "Warning!", message: "Please wait for the current transaction get complete.", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertView, animated: true, completion: nil)
        }
    }
    
    
    // MARK: API Payment and In app purchase
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.store.emptyQueue()
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
                transactionInProgress = false
                self.view.isUserInteractionEnabled = true
                self.indicator.stopAnimating()
                contentList.reloadData()
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
            transactionInProgress = false
            self.view.isUserInteractionEnabled = true
            self.indicator.stopAnimating()
            if notification.userInfo!["message"] as! String == "success"{
                contentList.reloadData()
            }
        default:
            break
        }
        
        
        
        
    }
    
}

