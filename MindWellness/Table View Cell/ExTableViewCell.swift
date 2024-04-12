//
//  ExTableViewCell.swift
//  MindWellness
//
//  Created by RLogixxTraining on 07/07/22.
//

import UIKit

class ExTableViewCell: UITableViewCell {
  
    
   
    @IBOutlet weak var Vw: UIView!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Clinic: UITextField!
    @IBOutlet weak var address: UITextView!
    @IBOutlet weak var imgS: UIImageView!
    @IBOutlet weak var Specialist: UITextField!
    @IBOutlet weak var Degree: UITextField!
    @IBOutlet weak var Phone: UITextView!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
   
    
}
