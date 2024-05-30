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
//        let style = NSMutableParagraphStyle()
//        style.lineSpacing = 20
//        let attributes = [NSAttributedString.Key.paragraphStyle : style]
//        txtDesc.attributedText = NSAttributedString(string: (arrData["desc"] as? String)!, attributes: attributes)
//        txtDesc.textColor = .white
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 20
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: style,
            .font: UIFont.systemFont(ofSize: 16) // Change desiredSize to your preferred font size
        ]
        txtDesc.attributedText = NSAttributedString(string: (arrData["desc"] as? String)!, attributes: attributes)
        txtDesc.textColor = .white

      
//
            print(arrData)
//        txtDesc.text = arrData["desc"] as? String
        txtTitle.text = arrData["title"] as? String
        imgMain.image = arrData["image"] as? UIImage
       
        

    }

    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
