//
//  collectionCell.swift
//  Kids_AR
//
//  Created by deemsys on 02/06/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation

class collectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
     @IBOutlet weak var label: UILabel!
    @IBOutlet weak var lockIcon: UIImageView!
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setCircularImageView()
    }
    
    func setCircularImageView() {
        self.imageView.layer.cornerRadius = CGFloat(roundf(Float(self.imageView.frame.size.width / 2.0)))
        self.imageView.layer.borderWidth = 2.0
         self.imageView.layer.borderColor = UIColor.white.cgColor
        
    }
}
