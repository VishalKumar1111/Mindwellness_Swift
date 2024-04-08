//
//  MentalBlogsViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 07/12/23.
//

import UIKit

class MentalBlogsViewController: UIViewController {

    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    
    var arrData = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
            print(arrData)
        txtDesc.text = arrData["desc"] as? String
        txtTitle.text = arrData["title"] as? String
        imgMain.image = arrData["image"] as? UIImage
       
        

    }

    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
