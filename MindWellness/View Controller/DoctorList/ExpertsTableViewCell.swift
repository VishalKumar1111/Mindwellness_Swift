//
//  ExpertsTableViewCell.swift
//  MindWellness
//
//  Created by RLogixxTraining on 21/11/23.
//

import UIKit

class ExpertsTableViewCell: UITableViewCell {

  
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    
    @IBOutlet weak var txtClinic: UILabel!
    @IBOutlet weak var txtAddress: UILabel!
    @IBOutlet weak var txtPhone: UILabel!
    @IBOutlet weak var txtCourse: UILabel!
    
    @IBOutlet weak var txtSpeciality: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        img.image = UIImage(named: "professional")
        img.layer.borderWidth = 1.0
        img.layer.masksToBounds = false
//        img.layer.borderColor = UIColor.white.cgColor
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        // Configure the view for the selected state
        
        
    }
    
}
