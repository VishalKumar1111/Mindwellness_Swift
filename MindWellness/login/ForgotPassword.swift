//
//  ForgotPassword.swift
//  MindWellness
//
//  Created by RLogixxTraining on 22/05/24.
//

import UIKit
import Firebase

class ForgotPassword: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
            
        }
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        Utilities.styleTextField(txtEmail)
        
    }
    

    @IBAction func btnSend(_ sender: Any) {
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: txtEmail.text!) { (error) in
           if let error = error {
                    // Display alert for error
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    return
                }
                let alert = UIAlertController(title: "Sucessfull ", message: "Password reset link has been sent to your email address", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                return
                
            }
            
            
        
    }
}
