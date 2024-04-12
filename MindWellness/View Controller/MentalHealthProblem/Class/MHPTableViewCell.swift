//
//  MHPTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 09/12/22.
//

import UIKit

class MHPTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var leftbtnMHP: UIButton!
    @IBOutlet weak var rightbtnMHP: UIButton!
    @IBOutlet weak var leftlblname: UILabel!
    @IBOutlet weak var rightlblname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        leftbtnMHP.layer.cornerRadius = 15
        rightbtnMHP.layer.cornerRadius = 8
    }
    
    

    @IBAction func leftbtnMHP(_ sender: Any) {
        
       
    }
    
    @IBAction func rightbtnMHP(_ sender: Any) {
    }
}
