//
//  PaidViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 17/08/22.
//

import UIKit

class PaidViewController: UIViewController {
  var a = [[String]]()
    var b = [[String]]()
    var c = [[String]]()
    
    @IBOutlet weak var paid: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }

        paid.layer.cornerRadius = 10
//        paid.setTitle(String?, for: <#T##UIControl.State#>)
    
    }
    
    @IBAction func next(_ sender: Any) {
        
        
        
        if a == [["yes"]] {
        let MoreQuizVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "morequiz") as? MoreQuizViewController
        
        self.navigationController?.pushViewController(MoreQuizVC!, animated: true)
        
        }
        
//        if b == [["yes"]] {
//        let AssessmentVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "assessment") as? AssessmentViewController
//
//        self.navigationController?.pushViewController(AssessmentVC!, animated: true)
//
//        }
//
        
        
    }
    
    

}
