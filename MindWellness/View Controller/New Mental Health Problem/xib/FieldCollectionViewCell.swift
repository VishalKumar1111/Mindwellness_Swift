//
//  FieldCollectionViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 22/02/23.
//

import UIKit

class FieldCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fieldImgViewOutlet: UIImageView!
    @IBOutlet weak var backgroundViewOutlet: UIView!
    @IBOutlet weak var fieldNameOutlet: UILabel!
    @IBOutlet weak var backgroundImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundViewOutlet.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Initialization code
        
        backgroundViewOutlet.layer.cornerRadius = 20
        backgroundImgView.layer.cornerRadius = 20
        fieldImgViewOutlet.layer.cornerRadius = 20
    }

}
