//
//  SoundMedTableViewCel.swift
//  MindWellness
//
//  Created by RLogixxTraining on 03/10/23.
//

import UIKit

class SoundMedTableViewCel: UITableViewCell {
    @IBOutlet weak var lblMed: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Initialization code
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        imgView.layer.borderWidth = 3.0
        imgView.layer.borderColor = UIColor.orange.cgColor
        // Configure the view for the selected state
        
        
    }
   
    
    
}
