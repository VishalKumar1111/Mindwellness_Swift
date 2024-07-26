//
//  QuestionAnswerViewController.swift
//  MindWellness
//
//  Created by iOS Training on 15/09/21.
//

import UIKit
protocol GoToCaroselDelegate:AnyObject{
    func sendDataToFirstViewController(gaugeData: Int)
    
}
class QuestionAnswerViewController: UIViewController,demoDelegate{
    func sendDataToSecondViewController(myData: Int) {
        print(myData)
        delegate?.sendDataToFirstViewController(gaugeData: myData)
//        self.navigationController?.popViewController(animated: true)
        
    }
    var DataFromGaugeVC = Int()
    weak var delegate: GoToCaroselDelegate?
    
    @IBOutlet weak var lblLetUsCalculate: UILabel!
    @IBOutlet weak var lblQuestionText: UILabel!
    @IBOutlet weak var btnOneOutlet: UIButton!
    @IBOutlet weak var btnTwoOutlet: UIButton!
    @IBOutlet weak var btnThreeOutlet: UIButton!
    @IBOutlet weak var btnFourOutlet: UIButton!
    @IBOutlet weak var progressvw: UIProgressView!
    @IBOutlet weak var progressreport: UILabel!
    
    var questions = [String]()
    var answers = [["Not At All" , "Once in a while" , "More Than Half Days" , "Nearly Every Day"]]
    var currentQuestion = 0
    var x = 0
    var y = 0
    var score = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
            
            lblLetUsCalculate.text = "Let's Calculate Your Stress".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        }
//        questions = ["Not Felling Pleasure  in doing things?" , "Feeling Down Or Depressed?" , "Not having Proper Sleep,Sleeping Less Or More " , "Feeling tired or Fatigued?" , "Poor appetite or overeating?" , "Negative Thoughts or that you are a failure or have let your family down?" , "Trouble concentrating on things?" , " Moving or speaking slowly that other people could have noticed? " , "Thoughts that you would be better off dead, or of Self Harm Or Sucide? "
//        ]
//        questions =  ["Not feeling pleasure  in doing things (In the last fifteen days)?" , "Feeling down Or depressed (In the last fifteen days)?" , "Not having proper sleep,sleeping less Or more (In the last fifteen days)?" , "Feeling tired or fatigued (In the last fifteen days)?" , "Poor appetite or overeating (In the last fifteen days)?" , "Negative thoughts or that you are a failure or have let your family down (In the last fifteen days)?" , "Trouble concentrating on things (In the last fifteen days)?" , " Moving or speaking slowly that other people could have commented  (In the last fifteen days)?" , "Thoughts that you would be better off dead, or of Self Harm Or Sucide (In the last fifteen days)?"]
//
        questions =  ["question_1" , "question_2" , "question_3" , "question_4" ,"question_5" ,"question_6" ,"question_7" ,"question_8" ,"question_9"]

        
        
        btnOneOutlet.layer.cornerRadius = 20
        btnTwoOutlet.layer.cornerRadius = 20
        btnThreeOutlet.layer.cornerRadius = 20
        btnFourOutlet.layer.cornerRadius = 20
        progressreport.layer.cornerRadius = 8
        progressreport.layer.masksToBounds = true
        
        print(questions)
        print(answers)
        
        
        progressreport.text = "Question".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + " \(currentQuestion + 1)" + "out of".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + "09".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        lblQuestionText.text = questions[currentQuestion].localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        buttonTitle()
        
    }
    
    func buttonTitle() {
        print(answers[currentQuestion][x])
        btnOneOutlet.setTitle(answers[currentQuestion][x].localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), for: .normal)
        btnTwoOutlet.setTitle(answers[currentQuestion][1].localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), for: .normal)
        btnThreeOutlet.setTitle(answers[currentQuestion][2].localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), for: .normal)
        btnFourOutlet.setTitle(answers[currentQuestion][3].localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), for: .normal)
        
    }
    
    
    
    func questionChange() {
        
        if questions.count - 1 == currentQuestion {
            print("The score is \(score)")
            print("Screen Changed")

            let GaugeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "gauge") as? GaugeMeterViewController
            GaugeVC!.gaugeval = score
            GaugeVC?.delegate1 = self
            self.navigationController?.pushViewController(GaugeVC!, animated: true)
        }
        else {
            
            currentQuestion += 1
            lblQuestionText.text = questions[currentQuestion].localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        }
    }
    
    @IBAction func btnAnswerOne(_ sender: Any) {
        questionChange()
        print("one")
        score += 0
        print(score)
        progressvw.progress += 0.1
        progressreport.text = "Question".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + " \(currentQuestion + 1)" + "out of".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + "09".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        
    }
    @IBAction func btnAnswerTwo(_ sender: Any) {
        questionChange()
        print("two")
        score += 01
        print(score)
        progressvw.progress += 0.1
        progressreport.text = "Question".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + " \(currentQuestion + 1)" + "out of".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + "09".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        
        
    }
    @IBAction func btnAnswerThree(_ sender: Any) {
        questionChange()
        print("three")
        score += 02
        print(score)
        progressvw.progress += 0.1
        progressreport.text = "Question".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + " \(currentQuestion + 1)" + "out of".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + "09".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        
        if progressvw.progress == 1.0{
            print("Reached")

//            let actionSheet = UIAlertController(title: "Serious", message: "You Need to concern to a Mental health Expert immediately in person ", preferredStyle: .actionSheet)
//
//
//
//            // Create your actions - take a look at different style attributes
//                   let reportAction = UIAlertAction(title:"OK" , style: .default) { (action) in
//                       // observe it in the buttons block, what button has been pressed
//                       print("didPress Message abuse")
//                   }
//
//
//                   // Add the actions to your actionSheet
//                   actionSheet.addAction(reportAction)
//                   // Present the controller
//                   self.present(actionSheet, animated: true, completion: nil)
            
            
            let alertController = UIAlertController(title: "Serious", message: "You need to concert a Mental Health Expert at the earliest in person", preferredStyle: .actionSheet)

            let action1 = UIAlertAction(title: "okButton".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), style: .default) { _ in
                print("Action 1 selected")
            }
            alertController.addAction(action1)

            // Change title and message text color to black
            let titleFont = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]
            let messageFont = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0)]

            // Apply attributed text to title and message
            alertController.setValue(NSAttributedString(string: "seriousAlertTitle".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), attributes: titleFont), forKey: "attributedTitle")
            alertController.setValue(NSAttributedString(string: "seriousAlertMessage".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), attributes: messageFont), forKey: "attributedMessage")

            // Present the action sheet
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }

            self.present(alertController, animated: true, completion: nil)


/*WORKING*/
//            let alertController = UIAlertController(title: "Serious", message: "You Need to concern to a Mental health Expert immediately in person", preferredStyle: .actionSheet)
//
//            let action1 = UIAlertAction(title: "OK", style: .default) { _ in
//                       print("Action 1 selected")
//                   }
//                   alertController.addAction(action1)
//
//                    // Change title and message text color to black
//                    let titleFont = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]
//                    let messageFont = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0)]
//
//                    alertController.setValue(NSAttributedString(string: "Serious", attributes: titleFont), forKey: "attributedTitle")
//                    alertController.setValue(NSAttributedString(string: "You Need to concern to a Mental health Expert immediately in person", attributes: messageFont), forKey: "attributedMessage")
//
////                    let action1 = UIAlertAction(title: "OK", style: .default) { _ in
////                        print("Action 1 selected")
////                    }
////                    alertController.addAction(action1)
//
//                    alertController.presentActionSheetFromBottom()

            
        }
        
    }
    @IBAction func btnAnswerFour(_ sender: Any) {
        questionChange()
        print("four")
        score += 03
        print(score)
        progressvw.progress += 0.1
        progressreport.text = "Question".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + " \(currentQuestion + 1)" + "out of".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + "09".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        if progressvw.progress == 1.0{
            print("Reached")
            let alertController = UIAlertController(title: "Serious", message: "You need to concert a Mental Health Expert at the earliest in person", preferredStyle: .actionSheet)
            
            let action1 = UIAlertAction(title: "okButton".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), style: .default) { _ in
                print("Action 1 selected")
            }
            alertController.addAction(action1)
            
            // Change title and message text color to black
            let titleFont = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]
            let messageFont = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0)]
            
            // Apply attributed text to title and message
            alertController.setValue(NSAttributedString(string: "seriousAlertTitle".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), attributes: titleFont), forKey: "attributedTitle")
            alertController.setValue(NSAttributedString(string: "seriousAlertMessage".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), attributes: messageFont), forKey: "attributedMessage")
            
            // Present the action sheet
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
//        if progressvw.progress == 1.0{
//            print("Reached")
//            let alertController = UIAlertController(title: "Serious", message: "You Need to concern to a Mental health Expert immediately in person ", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default)
//            alertController.addAction(okAction)
//            self.present(alertController, animated: true, completion: nil)
//
//        }
       
    }
   

    @IBAction func backbtn(_ sender: Any) {
        
        //self.navigationController?.popToRootViewController(animated: true)
        
        self.navigationController?.popViewController(animated: true)
    }
}
extension UIAlertController {
    func presentActionSheetFromBottom(animated: Bool = true, completion: (() -> Void)? = nil) {
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            if viewController.presentedViewController != nil {
                viewController.dismiss(animated: false, completion: nil)
            }
            viewController.present(self, animated: animated, completion: completion)
        }
    }
}
