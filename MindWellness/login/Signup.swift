

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class Signup: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var userChoice: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
    
        // Hide the error label
        errorLabel.alpha = 0
    
        // Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    

    @IBAction func signUpTapped(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
                
                if error != nil {
                    // There's something wrong with the fields, show error message
                    showError(error!)
                } else {
                    // Create cleaned versions of the data
                    let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    // Create the user
                    Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                        // Check for errors
                        if err != nil {
                            // There was an error creating the user
                            self.showError("Error creating user")
                        } else {
                            // User was created successfully, now store the first name, last name, and user choice
                            let db = Firestore.firestore()
                            db.collection("users").document(result!.user.uid).setData([
                                "firstname": firstName,
                                "lastname": lastName,
                                "uid": result!.user.uid,
                                "userChoice": self.userChoice?.isOn
                            ]) { (error) in
                                if let error = error {
                                    // Show error message
                                    self.showError("Error saving user data: \(error.localizedDescription)")
                                } else {
                                    // Transition to the home screen
                                    self.transitionToHome()
                                }
                            }
                        }
                    }
                }
            }
            
            func showError(_ message:String) {
                errorLabel.text = message
                errorLabel.alpha = 1
            }
            
            func transitionToHome() {
                let alertController = UIAlertController(title: "Alert Title", message: "User is created Successfully.", preferredStyle: .alert)
                
                // Create an action for the alert
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // Handle the OK button tap
                    print("OK button tapped")
                    
                    // Perform the action to move back (pop the view controller)
                    self.navigationController?.popViewController(animated: true)
                }
                
                // Add the action to the alert controller
                alertController.addAction(okAction)
                
                // Present the alert
                self.present(alertController, animated: true, completion: nil)
            }
        }
