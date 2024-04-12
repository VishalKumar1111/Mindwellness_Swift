//
//  DoctorListTableViewCell.swift
//  MindWellness
//
//  Created by RLogixxTraining on 21/10/22.
//

import UIKit

class DoctorListTableViewCell: UITableViewCell {

    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var Degree: UITextField!
    @IBOutlet weak var speciality: UITextField!
    @IBOutlet weak var clinicName: UITextField!
    @IBOutlet weak var address: UITextView!
    @IBOutlet weak var phoneNumber: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
