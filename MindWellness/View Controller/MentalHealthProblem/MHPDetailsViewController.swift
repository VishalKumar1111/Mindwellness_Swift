//
//  MHPDetailsViewController.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 15/12/22.
//

import UIKit

class MHPDetailsViewController: UIViewController {
    var MHPname = String()
    var MHPtextDetails = String()
    var MHPimage = UIImage()
    
    @IBOutlet weak var MHPimageview: UIImageView!
    @IBOutlet weak var lblMHPname: UILabel!
    @IBOutlet weak var detailsMHPtextview: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
        lblMHPname.text = MHPname
        detailsMHPtextview.text = MHPtextDetails
        MHPimageview.image = MHPimage

        
    }
    

}
