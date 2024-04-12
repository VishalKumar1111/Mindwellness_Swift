//
//  MoreQuizViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 04/08/22.
//

import UIKit

class MoreQuizViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var btnoneoutlet: UIButton!
    @IBOutlet weak var btntwooutlet: UIButton!
    @IBOutlet weak var Lblquestion: UILabel!
    @IBOutlet weak var progressview: UIProgressView!
    @IBOutlet weak var progressreport: UILabel!
    
    
    //MARK: Properties
    
    var questions = [String]()
    var strview = [["yes"]]
    var answers = [["Yes" , "No"]]
    var arrayAnswerCollection = [String]()
    var diseaseNameCollection = [String]()
    var arrdiseaseNameCollection = [String]()
    var arrdiseaseNameCollection2 = [String]()
    var arrDipressionAndBipolarBothFound = [String]()
    var arrdiseaseOfUser = [String]()
    var currentQuestion = 0
    var x = 0 //for quiz control
    var y = 0 //for quiz control
    var score = 0
    var depressionAndBipolar = Bool()
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
        
        questions = ["Have you suffered similar low mood problem in the past for more than two weeks? " ,  "Has there been a time for more than a week when you were more energetic, more happy or angry, more talkative or more confident than usual in the past" , " have you ever felt you are being followed , or people are plotting against you or talking foul about you" , " Do you ever hear voices which no one else does hear " , "Do you take any substance like alcohol, cannabis, cigarette , heroine etc " , "do you get intense desire to take the said substance when you don’t take it or you get some problems (withdrawls) when you stop it or cant limit the amount taken when you try to reduce it" , " Do you wash your hands often and more than usual, or keep checking doors, handles etc repeatedly (more than two weeks)" , "Do you have unwanted , unintentional thoughts which you try to stop but they don’t go " , "Do you have sudden severe attacks of anxiety in which you feel you are likely to die or go crazy"
        ]
        diseaseNameCollection = ["Depression" ,  "Bipolar Disorder" , "Psychosis" , "Psychosis" , "Substance Use" , "Substance use" , " OCD" , "OCD" , "Panic Attack"
        ]
        
        arrdiseaseNameCollection = ["Recurrent Depression" ,  "Bipolar Disorder" , "Psychosis" , "Psychosis" , "Substance Use" , "Substance Abuse" , " OCD" ,"Panic Attack"]
        arrdiseaseNameCollection2 = ["Depression" ,  "Bipolar Disorder" , "Psychosis" , "Psychosis" , "Substance Use" , "Substance Use" , " OCD" , "Panic Attack"]
        arrDipressionAndBipolarBothFound =  ["Bipolar disorder current episode Depression", "Bipolar disorder current episode Depression", "Psychosis" , "Psychosis" , "Substance Use" , "Substance Use" , " OCD" , "Panic Attack"]
        
        
        btnoneoutlet.layer.cornerRadius = btnoneoutlet.bounds.height/2
        btntwooutlet.layer.cornerRadius = btntwooutlet.bounds.height/2
        progressreport.layer.cornerRadius = 8 //your desire radius
        progressreport.layer.masksToBounds = true
        progressreport.text = " Question"+" \(currentQuestion + 1) out of 09"
        Lblquestion.text = questions[currentQuestion]
        buttonTitle()
    }
    
    //MARK: Methods
    
    func buttonTitle() {
        print(answers[currentQuestion][x])
        btnoneoutlet.setTitle(answers[currentQuestion][x], for: .normal)
        btntwooutlet.setTitle(answers[currentQuestion][1], for: .normal)
    }
    
    func questionChange() {
        
        if questions.count - 1 == currentQuestion {
            print("The score is \(score)")
            print("Screen Changed")
            calculateResult()
        }
        else {
            currentQuestion += 1
            Lblquestion.text = questions[currentQuestion]
        }
    }
    
    func calculateResult(){
        for index in 0..<arrayAnswerCollection.count {
            let firstElement = arrayAnswerCollection[0]
            let element = arrayAnswerCollection[index]
    
                if arrayAnswerCollection[0] == "1" && arrayAnswerCollection[1] == "1"{
                    self.depressionAndBipolar = true
                }
            
            if self.depressionAndBipolar == true {
                if element == "1"{
                    if arrdiseaseOfUser.count != 0{
                        if arrdiseaseOfUser.contains(arrDipressionAndBipolarBothFound[index]){
                            print("Already Found")
                        }else{
                            arrdiseaseOfUser.append(arrDipressionAndBipolarBothFound[index])
                        }
                       
                    }else{
                        arrdiseaseOfUser.append(arrDipressionAndBipolarBothFound[index])
                    }
                }
            }
            else{
                if firstElement == "1"{
                    if element == "1"{
                        if arrdiseaseOfUser.count != 0{
                            if arrdiseaseOfUser.contains(arrdiseaseNameCollection[index]){
                                print("Already Found")
                            }else{
                                arrdiseaseOfUser.append(arrdiseaseNameCollection[index])
                            }
                          
                        }else{
                            arrdiseaseOfUser.append(arrdiseaseNameCollection[index])
                        }
                    }
                }
                else if firstElement == "2"{
                    if arrdiseaseOfUser.count == 0{
                        arrdiseaseOfUser.append(diseaseNameCollection[index])
                    }else{
                        if element == "1"{
                            arrdiseaseOfUser.append(arrdiseaseNameCollection[index])
                        }
                    }
                }else{
                    if element == "1"{
                        arrdiseaseOfUser.append(diseaseNameCollection[index])
                    }
                }
            }
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AfterResultQuestionViewController") as! AfterResultQuestionViewController
        vc.arrOfResult = arrdiseaseOfUser.self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: IBAction
    
    @IBAction func btnAnswerOne(_ sender: Any) {
        questionChange()
            arrayAnswerCollection.append("1")
        
        progressview.progress += 0.1
        progressreport.text = "Question "+" \(currentQuestion + 1) out of 09 "
        
    }
    @IBAction func btnAnswerTwo(_ sender: Any) {
        questionChange()
        progressview.progress += 0.1
        
        if arrayAnswerCollection.count == 0{
            arrayAnswerCollection.append("2")
        }else{
            arrayAnswerCollection.append("0")
        }
        progressreport.text = "Question "+" \(currentQuestion + 1) out of 09 "
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
       // self.navigationController?.popToRootViewController(animated: true)
        
        if let navigationController = self.navigationController {
            
            

            // Specify the view controller class you want to pop to
            if let viewControllerToPopTo = navigationController.viewControllers.first(where: { $0 is CarouselViewController }) {

                // Pop to the specified view controller
                navigationController.popToViewController(viewControllerToPopTo, animated: false)
            }
        }
    }
    
}

