//
//  BMIViewController.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 09/04/23.
//

import UIKit

import UIKit

class BMIViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var weightIntLabel: UILabel!
    @IBOutlet weak var weightCardView: UIView!
    @IBOutlet weak var femaleViewOutlet: UIControl!
    @IBOutlet weak var weightPlusButton: UIButton!
    @IBOutlet weak var weightMinusButton: UIButton!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heigthIntlabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var pickWeight: UIPickerView!
    
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    //MARK: Properties
    
    var currentWeightVal = 50
    var currentAgeVal = 50
    var heightVal = 0
    var arrWeight = [Int]()
    var  calculatedBMI = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = "bmicalculator".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        lblHeight.text = "height".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        lblWeight.text = "weight".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        
        
        calculateButton.setTitle("calculate".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), for: UIControl.State.normal)
        
        
        
        
        self.viewBackground.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.arrWeight.removeAll()
        
        for i in 0..<500{
            self.arrWeight.append(i)
        }
        pickWeight.delegate = self
        pickWeight.dataSource = self
        pickWeight.layer.cornerRadius = 20
        heightView.layer.cornerRadius = 20
        weightCardView.layer.cornerRadius = 10
        weightPlusButton.layer.cornerRadius = weightPlusButton.frame.height/2
        weightMinusButton.layer.cornerRadius = 10
        calculateButton.layer.cornerRadius = calculateButton.frame.height/2
//        weightIntLabel.text = String(currentWeightVal)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        heightVal = currentValue
        heigthIntlabel.text = String(heightVal)
    }
    
    @IBAction func weightPlusBtn(_ sender: Any) {
        self.pickWeight.isHidden = false
    }
    
    @IBAction func weightMinusBtn(_ sender: Any) {
        currentWeightVal = currentWeightVal - 1
        weightIntLabel.text =  String(currentWeightVal)
    }
    
    @IBAction func calculateBtn(_ sender: Any) {
        
            let (weight,height) = changeUnitSystem()
            if weight == 0.0 || height == 0.0{
                let alert = UIAlertController(title: "Empty Field".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), message: "Fill Value of Height".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        
            let heightSqr = height * height
            calculatedBMI = weight / heightSqr
            let tipText: String = String(format: "%.2f", calculatedBMI)
        
        if calculatedBMI <= 18.5 {
            let alert = UIAlertController(title: "BMI".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), message: "Underweight Message".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + tipText + "under_remain".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), preferredStyle: UIAlertController.Style.alert)
            
            if let messageText = alert.view.subviews.first?.subviews.first?.subviews.first as? UILabel {
                // Set text alignment to left
                messageText.textAlignment = .left
            }

            alert.addAction(UIAlertAction(title: "Ok".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), style: UIAlertAction.Style.default, handler: nil))

            // Present the alert
            self.present(alert, animated: true, completion: nil)
            
            
//              alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//              self.present(alert, animated: true, completion: nil)
        }else if calculatedBMI >= 24.9{
            let alert = UIAlertController(title: "BMI".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), message: "Overweight Message".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + tipText + "over_remaining".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), preferredStyle: UIAlertController.Style.alert)
            if let messageText = alert.view.subviews.first?.subviews.first?.subviews.first as? UILabel {
                // Set text alignment to left
                messageText.textAlignment = .left
            }

            alert.addAction(UIAlertAction(title: "Ok".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), style: UIAlertAction.Style.default, handler: nil))

            // Present the alert
            self.present(alert, animated: true, completion: nil)
//
//              alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//              self.present(alert, animated: true, completion: nil)
          }else{
              let alert = UIAlertController(title: "BMI".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), message: "Healthy Weight Message".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + tipText + "healthy_remaining".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
              self.present(alert, animated: true, completion: nil)
          }
        }
    
}


extension BMIViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrWeight.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return "\(arrWeight[row])"
       }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedElement = arrWeight[row]
        print(selectedElement)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.weightIntLabel.text = "\(selectedElement)"
            self.currentWeightVal = selectedElement
            self.pickWeight.isHidden = true
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
}


extension BMIViewController{
    func changeUnitSystem()->(Double,Double){
        var convertedUnit = (0.0,0.0)
        
            let weight =  Double(weightIntLabel.text ?? "0.0") ?? 0.0
            convertedUnit.0 = weight
        
            let cm = Double(heigthIntlabel.text ?? "1") ?? 0.0
            convertedUnit.1 = cm * 0.01

        return convertedUnit
    }
    
//    @objc func textFieldDidChangeEditing(_ textField: UITextField){
//        let inches = Double(txtinchesoutlet.text ?? "0") ?? 0.0
//        if inches > 11{
//    let alertController = UIAlertController(title: "Invalid input. Please Select between (0-11)", message:nil, preferredStyle: UIAlertController.Style.alert) ;
//            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel,handler: { _ in
//                self.txtinchesoutlet.text = ""
//            }))
//    present(alertController, animated: true, completion: nil)
//        }
//    }

}
    
 
    
    
    
    
    
    
    

