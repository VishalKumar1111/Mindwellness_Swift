//
//  DoctorTableViewCell.swift
//  MindWellness
//
//  Created by RLogixxTraining on 16/05/24.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    
    @IBOutlet weak var txtClinic: UILabel!
    @IBOutlet weak var txtAddress: UITextView!
    @IBOutlet weak var txtPhone: UILabel!
    @IBOutlet weak var txtCourse: UILabel!
    @IBOutlet weak var txtSpeciality: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        img.image = UIImage(named: "professional")
        img.layer.borderWidth = 1.0
        img.layer.masksToBounds = false
//        img.layer.borderColor = UIColor.white.cgColor
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
        
    }
    
}
