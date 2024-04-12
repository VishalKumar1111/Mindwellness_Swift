//
//  PrivacyViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 09/04/24.
//

import UIKit

class PrivacyViewController: UIViewController {

    @IBOutlet weak var txtPrivacy: UITextView!
    @IBOutlet weak var btnBack: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.isNavigationBarHidden = true
        
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
           // self.tblView.insertSubview(imageView, at: 0)
            //self.titleBackground.insertSubview(imageView, at: 0)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
   

}
