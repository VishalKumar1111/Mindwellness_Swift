//
//  Login.swift
//  loginapp
//
//  Created by iOS Training on 12/01/24.
//

import UIKit
import FirebaseAuth


class Login: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshAlert = UIAlertController(title: "Security?", message: "Your Email Id and Phone Number will be Stored for proceeding Further.", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
        }))

        refreshAlert.addAction(UIAlertAction(title: "Details & Policies", style: .cancel, handler: { (action: UIAlertAction!) in
              print("Handle Cancel Logic here")
        }))

        present(refreshAlert, animated: true, completion: nil)
        
        
        
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }

        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    
        
        
@IBAction func loginokbtn(_ sender: Any) {
    
    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

      Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
          if let error = error {
              //self.showError("Invalid credential")
              let alertController = UIAlertController(title: "Error", message: "Login failed. Please check your credentials.", preferredStyle: .alert)
              let okAction = UIAlertAction(title: "OK", style: .default)
              alertController.addAction(okAction)
              self.present(alertController, animated: true, completion: nil)
              
              //self.showError(error.localizedDescription)
          } else {
              // Successful login, retrieve user's choice
//              self.retrieveUserChoice()
              self.performActionForTrueChoice()
          }
      }
  }

//  func retrieveUserChoice() {
//      guard let currentUserUID = Auth.auth().currentUser?.uid else {
//          // User not authenticated or UID not available
//          return
//      }
//
//      let db = Firestore.firestore()
//
//      db.collection("users").document(currentUserUID).getDocument { (document, error) in
//          if let document = document, document.exists {
//              if let userChoice = document.data()?["userChoice"] as? Bool {
//                  // Now you have the user's choice, you can perform actions accordingly
//                  if userChoice {
//                      // User chose true, perform the corresponding action
//                      self.performActionForTrueChoice()
//                  } else {
//                      // User chose false, perform another action
//                      self.performActionForFalseChoice()
//                  }
//              }
//          } else {
//              // Document does not exist or there was an error
//              self.showError("Error retrieving user choice: \(error?.localizedDescription ?? "Unknown error")")
//          }
//      }
//  }

  func performActionForTrueChoice() {
      // Perform action for true choice
      print("User chose true, perform the corresponding action.")
      // For example, you can navigate to a different screen or show a message
      let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let vc = storyBoard.instantiateViewController(withIdentifier: "CarouselViewController") as! CarouselViewController
      self.navigationController?.pushViewController(vc, animated: true)
   
     
      
  }

    func performActionForFalseChoice() {
        // Perform action for false choice
        print("User chose false, perform another action.")
        
        let alertController = UIAlertController(title: "Alert Title", message: "User is Detail Password or Email Inccorect!. Please fill correct Credentials.", preferredStyle: .alert)
        
        // Create an action for the alert
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] (action) in
            // Handle the OK button tap
            print("OK button tapped")
            
            // Perform the action to move back (pop the view controller)
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }

  func showError(_ message: String) {
      errorLabel.text = message
      errorLabel.alpha = 1
  }
    
    
    @IBAction func btnSignup(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "Signup") as! Signup
         self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
