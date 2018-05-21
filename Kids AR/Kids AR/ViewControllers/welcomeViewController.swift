//
//  welcomeViewController.swift
//  Kids AR
//
//  Created by deemsys on 17/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit


class welcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
@IBOutlet var settingsButton: UIButton!
    
    @IBOutlet var contentList: UITableView!
    
    
    override func viewDidLoad() {
        settingsButton.layer.cornerRadius = 5;
        settingsButton.clipsToBounds = true;
        
        contentList.delegate = self
        contentList.dataSource = self
        
        contentList.tableFooterView = UIView()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        self.rotateView()
//        timeTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.rotateView), userInfo: nil, repeats: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
       // stopView()
    }
    var timeTimer: Timer?

    
    @objc func rotateView()
    {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.settingsButton.transform = self.settingsButton.transform.rotated(by: CGFloat(360))
        })
    }
    
    func stopView()
    {
        timeTimer?.invalidate()
        self.settingsButton.layer.removeAllAnimations()
    }
    
       @IBAction func settingsAction(sender: UIButton) {
    
        
    }
    @IBAction func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // TableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row%2 != 0{
            return 120;
        }
        return 20;
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row%2 != 0 {
        
            // Content row
            let cell:tableCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as! tableCell?)!
           // print(indexPath.row)
            switch indexPath.row{
                
            case 1:
                cell.title.text = "Learn"
                cell.subTitle.text = "Alphabets"
                cell.bimage.image = #imageLiteral(resourceName: "alphabets")
                cell.bgView.backgroundColor = UIColor(red: 149/255, green: 78/255, blue: 164/255, alpha: 1.0)
                break;
            case 3:
                cell.title.text = "Know about"
                cell.subTitle.text = "Animals"
                cell.bimage.image = #imageLiteral(resourceName: "animals")
                cell.bgView.backgroundColor = UIColor(red: 247/255, green: 220/255, blue: 71/255, alpha: 1.0)
                break;
            case 5:
                cell.title.text = "Learn Fruits "
                cell.subTitle.text = "& Vegetables"
                cell.bimage.image = #imageLiteral(resourceName: "fruits")
                cell.bgView.backgroundColor = UIColor(red: 0/255, green: 108/255, blue: 249/255, alpha: 1.0)
                
                break;
            case 7:
                cell.title.text = "Play"
                cell.subTitle.text = "Puzzle"
                cell.bimage.image = #imageLiteral(resourceName: "puzzle")
                cell.bgView.backgroundColor = UIColor(red: 103/255, green: 150/255, blue: 0/255, alpha: 1.0)
                break;
                
            default:
                break;
            }
            
        
   
        
        // add border and color
        cell.backgroundColor = UIColor.clear        
        cell.bgView.layer.cornerRadius = 60
        cell.clipsToBounds = true
            
            return cell
        }
        else{
            // Empty cell row
            
             let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cellempty") as UITableViewCell?)!
            
            return cell;
        }
        
      //  return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if (tableView == self.contentList)
        {
//            //Top Left Right Corners
//            let maskPathTop = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 5.0, height: 5.0))
//            let shapeLayerTop = CAShapeLayer()
//            shapeLayerTop.frame = cell.bounds
//            shapeLayerTop.path = maskPathTop.cgPath
//
//            //Bottom Left Right Corners
//            let maskPathBottom = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 5.0, height: 5.0))
//            let shapeLayerBottom = CAShapeLayer()
//            shapeLayerBottom.frame = cell.bounds
//            shapeLayerBottom.path = maskPathBottom.cgPath
            
            //All Corners
            
            if indexPath.row%2 != 0 {
            let maskPathAll = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: [.topLeft, .topRight, .bottomRight, .bottomLeft], cornerRadii: CGSize(width: 5.0, height: 5.0))
            let shapeLayerAll = CAShapeLayer()
            shapeLayerAll.frame = cell.bounds
            shapeLayerAll.path = maskPathAll.cgPath
            
            
            cell.layer.mask = shapeLayerAll
            }
        }
    }
    
    
}
