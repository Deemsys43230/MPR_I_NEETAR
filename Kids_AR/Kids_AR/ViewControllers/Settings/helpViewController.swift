//
//  helpViewController.swift
//  Kids AR
//
//  Created by deemsys on 19/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class videoTableCell:UITableViewCell{
    
    @IBOutlet var audiobutton: UIButton!
    @IBOutlet var darkView: UIView!
    @IBOutlet var thumbnail: UIImageView!
}

class helpViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var contentList: UITableView!
    
    var itemPlayingDone:Bool = false
    var paused:Bool!
    
    var player = AVPlayer()
    var playerController = AVPlayerViewController()
    
    var thumbnailImage:UIImage? = nil
    
    override func viewDidLoad() {
        
        
        contentList.delegate = self
        contentList.dataSource = self
        
        contentList.tableFooterView = UIView()
 
      
        
    }
  
    
    @IBAction func backAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // TableView Delegates
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 , UIDevice.current.model == "iPhone"{
            return 215
        }else if indexPath.row == 1{
            return 315.3
        }
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 , UIDevice.current.model == "iPhone"{
            return 215
        }else if indexPath.row == 1{
            return 315.3
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.helpArray.count;
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            if indexPath.row == 0 || indexPath.row == 2{
                
                // Content row
                let cell:tableCell = (tableView.dequeueReusableCell(withIdentifier: "titlecell") as! tableCell?)!
                cell.title.text = Constants.helpArray[indexPath.row]
                // add border and color
                cell.backgroundColor = UIColor.clear
                return cell
            }
        else if indexPath.row == 1{
                 let cell:videoTableCell = (tableView.dequeueReusableCell(withIdentifier: "videocell") as! videoTableCell?)!
                
                
            // add border and color
            cell.backgroundColor = UIColor.clear
            return cell
        }
        if indexPath.row == Constants.helpArray.count - 1{
            let cell:tableCell = (tableView.dequeueReusableCell(withIdentifier: "happycell") as! tableCell?)!
            
            cell.title.text = Constants.helpArray[indexPath.row]
            // add border and color
            cell.backgroundColor = UIColor.clear
            return cell
        }
            let cell:tableCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as! tableCell?)!
            cell.title.text = Constants.helpArray[indexPath.row]
        cell.title.setLineSpacing()
            // add border and color
            cell.backgroundColor = UIColor.clear
            return cell
         
    }
 
    
  /*  func getThumbnailImage(videoURL:URL)
    {
        let asset = AVAsset(url: videoURL)
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        let time = CMTimeMakeWithSeconds(Float64(1), 100)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            self.thumbnailImage = thumbnail
        } catch {
            return
        }
    }*/

    
    func playVideo() {
        guard  let path  = Bundle.main.url(forResource: "finaldemo", withExtension: "mp4") else{return}
        do {
          
            player = AVPlayer(url: path);
            let playerController = AVPlayerViewController()
            playerController.player = player
            self.showDetailViewController(playerController, sender: self)
            
            // Add your view Frame
            playerController.view.frame = self.view.frame
            
            // Add sub view in your view
          //  self.view.addSubview(playerController.view)
            
            player.play()
        }
    }
    func stopVideo() {
        player.pause()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            self.playVideo()

        }
    }

}

extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 1.5, lineHeightMultiple: CGFloat = 1.3) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
