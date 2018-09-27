//
//  IAPHelper.swift
//  kidsar
//
//  Created by Uday on 25/05/18.
//  Copyright © 2018 Deemsys. All rights reserved.
//

import UIKit
import StoreKit
class IAPHelper: NSObject {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    static let IAPProductNotification = Notification.Name("IAPProductNotification")
    static let IAPTransactNotification = Notification.Name("IAPTransactNotification")
    static let IAPRestoreNotification = Notification.Name("IAPRestoreNotification")
    
    var tempProducts:[String] = []
    
    // request for product information from store using product id's
    func requestProductInfo() {
        // CHECK INTERNET CONNECTION
        if SKPaymentQueue.canMakePayments() {
            let productIdentifiers:NSSet = NSSet(array: delegate.productIDs)
            let productRequest:SKProductsRequest = SKProductsRequest(productIdentifiers: productIdentifiers as! Set<String>)
            productRequest.delegate = self as? SKProductsRequestDelegate
            productRequest.start()
        }
        else {
            NotificationCenter.default.post(name: IAPHelper.IAPProductNotification, object:nil,userInfo:["message":"incapable"])
            print("Cannot perform In App Purchases.")
        }
    }
    func emptyQueue(){
        SKPaymentQueue.default().remove(self)
    }
    // Initiate payment for a product
    func buy(p:SKProduct){
        let payment = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(payment)
    }
    
    // Restoring all purchased products
    func restore(){
        tempProducts.removeAll()
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    // Deleagte to identify failure in accessing products with store
    func request(_ request: SKRequest, didFailWithError error: Error) {
        NotificationCenter.default.post(name: IAPHelper.IAPProductNotification, object:nil,userInfo:["message":error.localizedDescription])
    }
    
    
    // MARK: Restore delegate and implementation
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        print("restore completed");
        NotificationCenter.default.post(name: IAPHelper.IAPRestoreNotification, object:nil,userInfo:["message":"success", "productids": self.tempProducts])
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
         print("restore failed");
        NotificationCenter.default.post(name: IAPHelper.IAPRestoreNotification, object:nil,userInfo:["message":error.localizedDescription])
    }
}

extension IAPHelper:SKProductsRequestDelegate{
    // Product request call back
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        if response.products.count != 0 {
            delegate.productsArray.removeAll()
            for product in response.products {
                delegate.productsArray.append(product)
            }
            NotificationCenter.default.post(name: IAPHelper.IAPProductNotification, object:nil,userInfo:["message":"success"])
        }
        else {
            print("There are no products.")
            NotificationCenter.default.post(name: IAPHelper.IAPProductNotification, object:nil,userInfo:["message":"No products available for purchase!"])
        }
        
        if response.invalidProductIdentifiers.count != 0 {
            print(response.invalidProductIdentifiers.description)
        }
    }
    
    
}

extension IAPHelper:SKPaymentTransactionObserver{
    // Payment request call back
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                print("Transaction completed successfully.")
                SKPaymentQueue.default().finishTransaction(transaction)
                let productId = transaction.payment.productIdentifier
                switch productId{
                case "com.deemsysinc.kidsar.basicmodels":
//                    UserDefaults.standard.set(true, forKey: productId)
//                    UserDefaults.standard.synchronize()
                    NotificationCenter.default.post(name: IAPHelper.IAPTransactNotification, object:nil,userInfo:["message":"success", "productid": "com.deemsysinc.kidsar.basicmodels"])
                case "com.deemsysinc.kidsar.premiummodel":
//                    UserDefaults.standard.set(true, forKey: productId)
//                    UserDefaults.standard.synchronize()
                    NotificationCenter.default.post(name: IAPHelper.IAPTransactNotification, object:nil,userInfo:["message":"success","productid": "com.deemsysinc.kidsar.premiummodel"])
                default:
                    break
                }
            case .failed:
                print("Transaction Failed");
                SKPaymentQueue.default().finishTransaction(transaction)
                NotificationCenter.default.post(name: IAPHelper.IAPTransactNotification, object:nil,userInfo:["message":"User cancelled the transaction or Failure!"])
                
            case .purchasing:
                print ("ongoing transaction");
                NotificationCenter.default.post(name: IAPHelper.IAPTransactNotification, object:nil,userInfo:["message":"progress"])
                
                
            case .restored:
                print("restored transactions");
                SKPaymentQueue.default().finishTransaction(transaction)
                let productId = transaction.original?.payment.productIdentifier
                tempProducts.append(productId!)
//                switch productId{
//                case "com.deemsysinc.kidsar.basicmodels":
////                    UserDefaults.standard.set(true, forKey: productId!)
////                    UserDefaults.standard.synchronize()
//                    NotificationCenter.default.post(name: IAPHelper.IAPRestoreNotification, object:nil,userInfo:["message":"success", "productid": "com.deemsysinc.kidsar.basicmodels"])
//                case "com.deemsysinc.kidsar.premiummodel":
////                    UserDefaults.standard.set(true, forKey: productId!)
////                    UserDefaults.standard.synchronize()
//                    NotificationCenter.default.post(name: IAPHelper.IAPRestoreNotification, object:nil,userInfo:["message":"success","productid": "com.deemsysinc.kidsar.premiummodel"])
//                default:
//                    break
//                }
                
            default:
                print(transaction.transactionState.rawValue)
            }
        }
    }
    
    
}
