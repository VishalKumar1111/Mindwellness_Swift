//
//  LastCollectionViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 23/02/23.
//

import UIKit

class LastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fieldImgView: UIImageView!
    @IBOutlet weak var fieldNameOutlet: UILabel!
    @IBOutlet weak var backgroundImgViewOutlet: UIImageView!
    @IBOutlet weak var backgroundViewOutlet: UIView!
    var arrName = [String:Any]()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundViewOutlet.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Initialization code
        
        backgroundViewOutlet.layer.cornerRadius = 20
        backgroundImgViewOutlet.layer.cornerRadius = 20
        fieldImgView.layer.cornerRadius = 20
    }

}
