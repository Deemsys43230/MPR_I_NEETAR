//
//  PopUpViewController.swift
//  Kids_AR
//
//  Created by deemsys on 04/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit

protocol popupDelegate {
    
    func didSelectModel(withName:String, audioName:String, modelID:String)
}

class PopUpViewController:UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var levelname: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    public var index:Int = 0
    var chapters:[String:Any] =  [:]
    
    @IBOutlet var themeImage: UIImageView!
    @IBOutlet var menuView: UIView!
    @IBOutlet var colorView: UIView!
    
    var delegate: popupDelegate?
    
    
    @IBOutlet var viewHeight: NSLayoutConstraint!
    @IBOutlet var viewWidth: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        switch index+1 {
        case 1:
            // Alphabets
            self.themeImage.image = #imageLiteral(resourceName: "alphabets_theme")
            self.colorView.backgroundColor = UIColor.init(red: 195/255, green: 26/255, blue: 51/255, alpha: 0.5)
            break
        case 2:
            // animals
            self.themeImage.image = #imageLiteral(resourceName: "animals_theme")
            self.colorView.backgroundColor = UIColor.init(red: 39/255, green: 174/255, blue: 96/255, alpha: 0.6)
            break
        case 3:
            // fruits
            self.themeImage.image = #imageLiteral(resourceName: "veggs_theme")
            self.colorView.backgroundColor = UIColor.init(red: 225/255, green: 205/255, blue: 180/255, alpha: 0.7)
            break
        default:
            break
        }
    
        
        if UIDevice.current.model == "iPhone"{
        
        if self.view.frame.width == 320{
            viewWidth.constant = 300
            viewHeight.constant = 415
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSONFile()
        
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()
        
        // Do any additional setup after loading the view.
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopUp(_ sender: AnyObject) {
        self.removeAnimate()
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let model = self.chapters["models"] as! [[String:Any]]
         let itemValues = model[indexPath.row]
        guard let cell:collectionCell = collectionView.cellForItem(at: indexPath) as! collectionCell else { return }
        if cell.lockIcon.isHidden == true{
            // purchased
            self.removeAnimate()
            delegate?.didSelectModel(withName: itemValues["modelName"] as! String, audioName: itemValues["audioName"] as! String, modelID: itemValues["modelId"] as! String)
        }else{
            // not purchased
        }
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
}

//extension PopUpViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: collectionView.frame.size.width/3.0 - 8,
//                      height: collectionView.frame.size.width/3.0 - 8)
//    }
//}

