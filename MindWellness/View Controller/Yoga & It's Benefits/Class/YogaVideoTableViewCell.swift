//
//  YogaVideoTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 06/01/23.
//

import UIKit

class YogaVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var lblofName: UILabel!
    @IBOutlet weak var aasanDetailsTextLblOlt: UILabel!
    @IBOutlet weak var opacityViewOlt: UIView!
    @IBOutlet weak var videoImgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // self.bgView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Initialization code
        
        bgView.layer.cornerRadius = 20
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOpacity = 0.5
        bgView.layer.shadowOffset = .zero
        bgView.layer.shadowRadius = 5
        self.cellImage.layer.cornerRadius = 20
        self.opacityViewOlt.layer.cornerRadius = 20
        self.videoImgView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }
    
}
