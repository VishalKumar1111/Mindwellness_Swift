//
//  ViewController.swift
//  loginapp
//
//  Created by iOS Training on 12/01/24.
//


import UIKit


class ViewController: UIViewController {

   
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
   
    
    func setUpElements() {

     Utilities.styleFilledButton(signUpButton)
    Utilities.styleHollowButton(loginButton)
        
    }
    
    

    @IBAction func loginbtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "Login") as! Login
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func singupbtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "Signup") as! Signup
         self.navigationController?.pushViewController(vc, animated: true)
    }
}

