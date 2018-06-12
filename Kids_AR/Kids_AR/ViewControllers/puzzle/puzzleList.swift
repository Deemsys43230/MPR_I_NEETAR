//
//  puzzleList.swift
//  Kids_AR
//
//  Created by deemsys on 11/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import UIKit

class puzzleCell: UITableViewCell {
    @IBOutlet weak var productImage:UIImageView!
}

class puzzleList : UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var contentList: UITableView!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        contentList.delegate = self
        contentList.dataSource = self
        
        contentList.tableFooterView = UIView()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.pauseSound()
        
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
    
    // TableView Delegates
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 1{
//            //empty space
//            return 10
//        }
        if self.view.frame.width == 320{
            return 200
        }
        else if UIDevice.current.model != "iPhone"{
            return 300
        }
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! puzzleCell
        
        
        switch indexPath.row {
        case 0:
            cell.productImage.image = #imageLiteral(resourceName: "puzzles_fruits")
            break
        case 1:
            cell.productImage.image = #imageLiteral(resourceName: "puzzle_animals")
            break
        
        default:
            cell.productImage.image = nil
            return cell
            break
        }
        
      cell.productImage.contentMode = .redraw
        cell.productImage.clipsToBounds = true
        cell.productImage.layer.cornerRadius = 8
      //  cell.productImage.layer.borderColor = UIColor.white.cgColor
       // cell.productImage.layer.borderWidth = 2
        
        cell.contentView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        cell.contentView.alpha = 0.0;
        UIView.animate(withDuration: 1.0, animations: {
            cell.contentView.alpha = 1.0
            cell.contentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "puzzleView") as! puzzleView
        vc.index = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
   
    
    
    @IBAction func backAction(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}



