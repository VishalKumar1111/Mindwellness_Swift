//
//  GaugeMeterViewController.swift
//  MindWellness
//
//  Created by iOS Training on 24/09/21.
//

import UIKit
import ABGaugeViewKit
import CircularCarousel

protocol demoDelegate:AnyObject{
    func sendDataToSecondViewController(myData: Int)
     
}
class GaugeMeterViewController: UIViewController{
    
    @IBOutlet weak var resultView: UIView!
    //MARK: IBOutlets
   
    @IBOutlet weak var txtResult: UITextView!
    
    @IBOutlet weak var backbtn1: UIButton!
    @IBOutlet weak var backToMain: UIButton!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var possiblediagnosis: UIButton!
    @IBOutlet weak var thoseWhoCanHelp: UIButton!
    @IBOutlet weak var gaugeview: ABGaugeView!
    @IBOutlet weak var resultBgView: UIView!
    @IBOutlet weak var resultPercentLblOlt: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var timer: Timer?
    
    var count = 0
    
    



//  var colors: [UIColor]  = [
//    UIColor(red: 237, green: 37, blue: 78),
//    UIColor(red: 249, green: 220, blue: 92),
//    UIColor(red: 194, green: 234, blue: 189),
//    UIColor(red: 1, green: 25, blue: 54),
//    UIColor(red: 255, green: 184, blue: 209)
//  ]
    var bgcolor = UIColor()
    
    let scaleMultiplier:CGFloat = 0.25
    let minScale:CGFloat = 0.55
    let maxScale:CGFloat = 1.08
    let minFade:CGFloat = -2.0
    let maxFade:CGFloat = 2.0
    let defaultButtonWidth: CGFloat = 100.0
    
    //MARK: Properties
    
    weak var delegate1 : demoDelegate?
    var str = [[String]]()
    var gaugeval = 0
    var average = 0
    var signal =  [["yes"]]
    var arrShowResult = [String]()
    var currentPage: Int = 0
    
    var arrDepressionDetail = ["","Depression is exhemely common. 8-10 crore Indians suffer from it.","", "It is a treatable condition improves in around 3months.","", "Treatment is usually continued for minimum of 6 months","", "You need to bring some lifestyle changes for prevention of future episodes"]
    
    var showFilterMenu = false
    var resultIndex = 0
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        txtResult.centerVertically()
        self.txtResult.textAlignment = .center
        
        
        possiblediagnosis.setTitle("Tap here to know possible diagnosis".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), for: .normal)
        thoseWhoCanHelp.setTitle("Connect with experts".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), for: .normal)
        
        
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
           
            
//            collectionView.dataSource = self
//            collectionView.delegate = self
            
          
            self.view.insertSubview(imageView, at: 0)
//            collectionView.layer.borderWidth = 3
//            collectionView.layer.borderColor = UIColor.white.cgColor
        }
        
       
//
//          collectionView.collectionViewLayout = CardsCollectionViewLayout()
//
////                  collectionView.isPagingEnabled = false
//                  collectionView.showsHorizontalScrollIndicator = false
//                  collectionView.register(LabelCollectionViewCell.self, forCellWithReuseIdentifier: LabelCollectionViewCell.reuseIdentifier)
//
////          startAutoSwipe()
        
        
       
        
        average = (gaugeval*100)/24
        self.navigationItem.hidesBackButton = true
        self.thoseWhoCanHelp.layer.cornerRadius = thoseWhoCanHelp.bounds.height/2
        self.possiblediagnosis.layer.cornerRadius = possiblediagnosis.bounds.height/2
     //   self.resultBgView.layer.cornerRadius = 20
        self.gaugeview.backgroundColor = .clear
      //  self.result.backgroundColor = .clear
        self.gaugeview.needleValue = CGFloat(average)
        
        if average >= 40{
            possiblediagnosis.isHidden = false
            //self.animateView(view: self.resultBgView, repetitions: self.arrDepressionDetail.count,duration: 5.0)
           // self.animateView(view: self.resultBgView, repetitions: self.arrDepressionDetail.count, blinkDuration: 6.0, delayBetweenBlinks: 0.0)
            
        }
        if average <= 10 {
            // result.text! = "Great your responses are suggested of good mental health."
            
            var arrData = ["Great","Your mental health is good","Continue working on your mental health. Exercise, socialize and don’t use any substance.", "Come back again whenever you feel stressed."]
            arrShowResult = arrData
            txtResult.text = arrShowResult[0].localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
//            bgcolor = UIColor.gray
//            bgcolor = UIColor(hex: "0B2F2D")
            
            
        }else if average <= 30{
            //result.text! = "Great your responses are suggested of good mental health."
            var arrData = ["You are possibly suffering from Clinical Depression.","We suggest you bring lifestyle changes.","Exercise daily, take good sleep improve nutrition.","Socialize, meet friends and family, get involved in hobbies Write a Journal or seek counseling.","Recommended: further questions to help you find complete possible diagnosis.","For ADVICE: connect to our experts on Mental Health and Lifestyle Changes"]
            arrShowResult = arrData
//            bgcolor = UIColor.systemYellow
//            bgcolor = UIColor(hex: "0B2F2D")
            txtResult.text = arrShowResult[0].localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        }else if average <= 50{
            var arrData = ["You possibly suffer from Moderate Depression.","It is a treatable condition.","A Depressive episode typically improves over 3-4 months with treatment.","Treatment includes Medications with Therapy.","You need to bring Lifestyle Changes (Exercise, socialize, sleep hygiene)","We suggest you to consult a Mental Health Expert (Psychiatrist or Clinical Psychologist)","Recommended: further questions to help you find complete possible diagnosis.","For ADVICE: connect to our experts on Mental Health and Lifestyle Changes","Come back to us to track your improvement in a week."]
           arrShowResult = arrData
            txtResult.text = arrShowResult[0].localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
          //  result.text! = "You are seems to be stressed but you are not suggested for clincal depression.\n You need to change lifestyle."
//            UIColor(hex: "0B2F2D")
        }else if average <= 70{
            var arrData = ["You possibly suffer from Moderately Severe Depression.","It is a treatable condition.","A Depressive episode typically improves over 3-4 months with treatment.","Treatment includes Medications with or without Therapy.","You need to bring Lifestyle Changes (Exercise, socialize, sleep hygiene)","Recommended: further questions to help you find complete possible diagnosis.","For ADVICE: connect to our experts on Mental Health and Lifestyle Changes","Come back to us to track your improvement in a week."]
        //    result.text! = "Your responses are suggestive of clinical depression."
            arrShowResult = arrData
            txtResult.text = arrShowResult[0].localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
//            bgcolor = UIColor(hex: "0B2F2D")
            
        }else if average <= 100{
            
//            result.text! = "Your responses are suggestive of clinical depression."
            var arrData = ["You possibly suffer from Severe Depression.","It is a treatable condition.","A Depressive episode typically improves over 3-4 months with treatment.","Treatment includes Medications with Therapy.","You need to bring Lifestyle Changes (Exercise, socialize, sleep hygiene)","Recommended: further questions to help you find complete possible diagnosis.","For ADVICE: connect to our experts on Mental Health and Lifestyle Changes","Come back to us to track your improvement in a week."]
            arrShowResult = arrData
            txtResult.text = arrShowResult[0].localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
//            bgcolor = UIColor.red
//          bgcolor = UIColor(hex: "0B2F2D")
            
        }
        self.resultPercentLblOlt.text = "Your Stress Level".localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "") + " \(self.average)%"
        
        if str == [["yes"]]{
            possiblediagnosis.isHidden = true
        }
    }
    
    //MARK: Aniamting View Function
    
//    func animateView(view: UIView, repetitions: Int, blinkDuration: TimeInterval, delayBetweenBlinks: TimeInterval) {
//        UIView.animate(withDuration: blinkDuration, delay: 0, options: .curveEaseInOut, animations: {
//            self.resultBgView.alpha =  self.resultBgView.isHidden ? 1.0 : 0.0
//            //view.alpha = view.isHidden ? 1.0 : 0.0
//        }) { _ in
//            self.resultBgView.isHidden = !self.resultBgView.isHidden
//
//            if repetitions > 1 {
//                // Call the function recursively with repetitions decremented by 1
//                self.result.text = self.arrDepressionDetail[self.resultIndex]
//                DispatchQueue.main.asyncAfter(deadline: .now() + delayBetweenBlinks) {
//                    if self.arrDepressionDetail.count-1 != self.resultIndex{
//
//                        if self.resultIndex%2 == 0{
//                            self.animateView(view: self.resultBgView, repetitions:self.arrDepressionDetail.count-1, blinkDuration: 0.0, delayBetweenBlinks: 0.0)
//                            self.resultIndex+=1
//                        }else{
//                            self.animateView(view: self.resultBgView, repetitions:self.arrDepressionDetail.count-1, blinkDuration: 4.0, delayBetweenBlinks: 0.0)
//                            self.resultIndex+=1
//                        }
//
//                    }else{
//                        self.resultBgView.isHidden = false
//                    }
//
//                }
//            }
//        }
//    }

    //MARK: IBActions
    
    @IBAction func possiblediagnosis(_ sender: Any) {
        
        let PaidVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PaidViewController") as? PaidViewController
        PaidVC!.a = signal
        self.navigationController?.pushViewController(PaidVC!, animated: true)
    }
    @IBAction func Whohelpyou(_ sender: Any) {
        let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "assessment") as? AssessmentViewController
//        self.(CommonVC!, animated: true)
        self.navigationController?.pushViewController(CommonVC!, animated: true)
        
//        self.present(CommonVC!, animated: true)
    }
    
    
    
   
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.reuseIdentifier, for: indexPath) as? LabelCollectionViewCell else {
//               fatalError("Failed to dequeue CustomCollectionViewCell")
//           }
//
//           cell.backgroundColor = UIColor(hex: "0B2F2D")
//           cell.label.text = arrShowResult[indexPath.row]
//           cell.label.textColor = .white
//
//
//
//           return cell
//       }
//
//
//
//
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return arrShowResult.count
//    }
  



    
    @IBAction func btnPrev(_ sender: Any) {
        if count >= 1  {
            count -= 1
            
            txtResult.text = arrShowResult[count].localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
            
            
        }else{
            
            print("less tha zero or equal to zero")
        }
        
        
    }
    @IBAction func btnNext(_ sender: Any) {
        if count < arrShowResult.count - 1  {
            count += 1
            txtResult.text = arrShowResult[count].localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
                   
            
        }
        else {
            
            print("greater than zero")
        }
    }
    
    
    @IBAction func prevBtn(_ sender: Any) {
        if count >= 1  {
            count -= 1
            
            txtResult.text = arrShowResult[count].localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
            
            
        }else{
            
            print("less tha zero or equal to zero")
        }
        
        
    }
    @IBAction func nextBtn(_ sender: Any) {
        if count < arrShowResult.count - 1  {
            count += 1
            txtResult.text = arrShowResult[count].localizableString(forLocalization:  UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
                   
            
        }
        else {
            
            print("greater than zero")
        }
    
        
    }
    
    
    
    
    
    

        
        //        guard let visibleIndexPath = collectionView.indexPathsForVisibleItems.first else {
//                   return
//               }
//
//               let nextItem = min(visibleIndexPath.item + 1, collectionView.numberOfItems(inSection: visibleIndexPath.section) - 1)
//               let nextIndexPath = IndexPath(item: nextItem, section: 0)
//
//               if nextItem >= 0 {
//                   // Disable paging to allow manual scrolling
//                   collectionView.isPagingEnabled = false
//
//                   collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
//
//                   // Re-enable paging after scrolling
//                   collectionView.isPagingEnabled = true
//               } else {
//                   print("You are at the last item")
//               }
//           }
        func scrollToItemAtIndexPath(indexPath: IndexPath, atScrollPosition scrollPosition:     UICollectionView.ScrollPosition, animated: Bool) {
            collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: animated)
        }

        
        
        //        guard let visibleIndexPath = collectionView.indexPathsForVisibleItems.first else { return } // Use indexPathsForVisibleItems
//
//              var nextIndexPath = IndexPath(item: visibleIndexPath.item + 1, section: visibleIndexPath.section)
//
//              // Handle reaching the end of the collection view
//              if nextIndexPath.item >= arrShowResult.count {
//                  nextIndexPath = IndexPath(item: 0, section: visibleIndexPath.section) // Wrap around
//              }
//              collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
//          }
        
      
    @IBAction func backToMain(_ sender: Any) {
        self.delegate1?.sendDataToSecondViewController(myData: average)
        
//
//        self.navigationController?.popViewController(animated: true)
        //self.navigationController?.popViewController(animated: true)
        if let navigationController = self.navigationController {

            // Specify the view controller class you want to pop to
            if let viewControllerToPopTo = navigationController.viewControllers.first(where: { $0 is CarouselViewController }) {

                // Pop to the specified view controller
                navigationController.popToViewController(viewControllerToPopTo, animated: false)
            }
        }
        
    }
    
  
     
    
}
//extension GaugeMeterViewController :  {
//
//
//
//
//      override func viewWillDisappear(_ animated: Bool) {
//              super.viewWillDisappear(animated)
//
//              // Stop automatic swiping when the view disappears
////              stopAutoSwipe()
//          }
//
////          func startAutoSwipe() {
////              // Invalidate any existing timer
////              stopAutoSwipe()
////
////              // Create and start a new timer for automatic swiping
////              timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(autoSwipe), userInfo: nil, repeats: true)
////          }
////
////          @objc func autoSwipe() {
////              // Calculate the next index to scroll to
////              var nextPage = collectionView.contentOffset.x + collectionView.frame.size.width
////              if nextPage >= collectionView.contentSize.width {
////                  nextPage = 0
////              }
////
////              // Scroll to the next page
////              collectionView.setContentOffset(CGPoint(x: nextPage, y: 0), animated: true)
////          }
////
////          func stopAutoSwipe() {
////              // Invalidate the timer to stop automatic swiping
////              timer?.invalidate()
////              timer = nil
////          }



  extension UIColor {
//    convenience init(red: Int, green: Int, blue: Int) {
//      self.init(red: CGFloat(red)/255 ,
//                green: CGFloat(green)/255,
//                blue: CGFloat(blue)/255,
//                alpha: 1.0)
//    }
      convenience init(hex: String, alpha: CGFloat = 1.0) {
              var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
              hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

              var rgb: UInt64 = 0

              Scanner(string: hexSanitized).scanHexInt64(&rgb)

              let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
              let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
              let blue = CGFloat(rgb & 0x0000FF) / 255.0

              self.init(red: red, green: green, blue: blue, alpha: alpha)
          }
      
      
  }
//extension UITextView {
//        func centerVertically() {
//            self.textAlignment = .center
//        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
//        let size = sizeThatFits(fittingSize)
//        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
//        let positiveTopOffset = max(1, topOffset)
//        textContainerInset.top = positiveTopOffset
//    }
//}
//

extension UITextView {
    func centerVerticallyAndHorizontally() {
        // Center text horizontally
        self.textAlignment = .center

        // Center text vertically
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        textContainerInset.top = positiveTopOffset
    }
}
