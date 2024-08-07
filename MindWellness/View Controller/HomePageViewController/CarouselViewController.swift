//
//  CarouselViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 21/10/22.
//

import UIKit
import CircularCarousel
import AVKit
import FirebaseAuth

class CarouselViewController: UIViewController, GoToCaroselDelegate{
    @IBOutlet weak var tapView: UIView!
    
    @IBOutlet weak var lblTapTOProceed: UILabel!
    @IBOutlet weak var appName: UILabel!
    
    @IBOutlet weak var lblMore: UILabel!
//    var   arrOfSideMenuContents = ["Your Profile","Calc Your BMI","Food & Diet","Meditation Sounds","Share"]
    var   arrOfSideMenuContents = ["calcBmi","foodDiet","meditationSounds","share","Logout"]
    
    var color = ["bg3.jpeg", "bg4.jpeg" , "bg5.jpeg" , "bg6.jpeg" ]
    var music = [String]()
    @IBOutlet weak var soundbtn: UIButton!
    @IBOutlet weak var carouselLabel: UILabel!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stressResultView: UIView!
    @IBOutlet weak var stressResultlbl: UILabel!
    @IBOutlet var carousel : CircularCarousel!
    @IBOutlet weak var sideBarBtnOutlet: UIButton!
    @IBOutlet weak var backgroundImageforSideMenu: UIImageView!
    @IBOutlet weak var viewForSideMenu: UIView!
    @IBOutlet weak var closeSideMenu: UIButton!
    @IBOutlet weak var yourStressLblIs: UILabel!
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var controlView: UIControl!
    let scaleMultiplier:CGFloat = 0.25
    let minScale:CGFloat = 0.55
    let maxScale:CGFloat = 1.08
    let minFade:CGFloat = -2.0
    let maxFade:CGFloat = 2.0
    let defaultButtonWidth: CGFloat = 100.0
    
    var timer: Timer?
    var isBlinking = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setUpLocalization()
        
        
        
        startBlinking()
        
//        appName.font = UIFont(name: "Special Valentine", size: 24)
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
            
        }
        viewForSideMenu.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        carousel.delegate = self
        carousel.dataSource = self
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 10
        textView.layer.cornerRadius = 10
        bigImage.layer.cornerRadius = 10
        carousel.scroll(byNumberOfItems: 5, withDuration: 4)
         playSound()
        stressResultView.isHidden = false
        viewForSideMenu.layer.cornerRadius = 20
        viewForSideMenu.layer.masksToBounds = true
        self.navigationController?.isNavigationBarHidden = true
        tblView.delegate = self
        tblView.dataSource = self
        tblView.layer.cornerRadius = 15
//        yourStressLblIs.text = "Your Stress Result Will Display Here."
        yourStressLblIs.text = "stress_level".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "" )
        lblMore.text = "more".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        lblTapTOProceed.text = "Tap To Proceed".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
    }
    
    func setUpLocalization() {
        // Retrieve saved language choice
        if let savedLanguage = UserDefaults.standard.string(forKey: "currentLanguage") {
            LanguageChange(language: savedLanguage)
        }
    }
    
    
    func LanguageChange(language: String) {
        appName.text = "Mindwellness".localizableString(forLocalization: language)
        
        
       
    }

    
    
    //Timer On View
    func toggleTapViewVisibility() {
        tapView.isHidden = !tapView.isHidden
    }

    // Method to be called when the timer fires
    @objc func timerFired() {
        // Toggle the visibility of tapView
        toggleTapViewVisibility()
        
        stopBlinking()
        
    }

    // Start the blinking timer
    func startBlinking() {
        // Ensure blinking is not already in progress
        guard !isBlinking else { return }
        
        // Set the flag to indicate blinking is in progress
        isBlinking = true
        
        // Schedule a method call after 3 seconds
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }

    // Stop blinking
    func stopBlinking() {
        // Ensure blinking is in progress
        guard isBlinking else { return }
        
        // Reset the flag
        isBlinking = false
        
        // Stop the timer
        stopTimer()
    }
    
    func stopTimer() {
               timer?.invalidate()
               timer = nil
           }
    
    var player: AVAudioPlayer?
    
    func playSound() {
        let url = Bundle.main.url(forResource: "sound", withExtension: "mpeg")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
            
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func stopSound() {
        let url = Bundle.main.url(forResource: "sound", withExtension: "mpeg")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.stop()
            
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    
    func sendDataToFirstViewController(gaugeData : Int) {
        let StressVal = gaugeData
        let strVal = String(StressVal)
        stressResultlbl.text = "\(strVal)"+"%"
        yourStressLblIs.text = "Your Stress Level".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "" )
        stressResultlbl.isHighlighted = false
        
    }
    
    @IBAction func soundbtn(_ sender: Any) {
        
        
        print("ButtonPressed")
        if (soundbtn.isSelected == false)
        {
            
            soundbtn.setImage(#imageLiteral(resourceName: "Mute"), for: .normal)
            soundbtn.backgroundColor = .clear
            soundbtn.isSelected = true
            stopSound()
            
        }
        else
        {
            
            playSound()
            soundbtn.setImage(#imageLiteral(resourceName: "Sound"), for: .normal)
            soundbtn.backgroundColor = .clear
            soundbtn.isSelected = false
        }
        
    }
    
    @IBAction func sideBarBtn(_ sender: Any) {
        print("buttonPressed")
        sideBarBtnOutlet.isHidden = true
        viewForSideMenu.isHidden = false
        
    }
    @IBAction func closeSideMenu(_ sender: Any) {
        
        sideBarBtnOutlet.isHidden = false
        viewForSideMenu.isHidden = true
    }
    @IBAction func controlView(_ sender: Any) {
        
        print("Control Btn Pressed")
        if titleLabel.text == "How this app can help you"{
            
            print("How this app can help you")
        }else if titleLabel.text == "Calculate Your Stress"{
            print("Calculate Your Stress")
            let Questionvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "question") as? QuestionAnswerViewController
            Questionvc!.delegate = self
            
            self.navigationController?.pushViewController(Questionvc!, animated:true)
            
        }else if titleLabel.text == "Yoga For Mental Health"{
            print("Yoga For Mental Health")
            let Yogavc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MentalHealthViewController") as? MentalHealthViewController
            
            self.navigationController?.pushViewController(Yogavc!, animated: true)
            
        }else if titleLabel.text == "Mental Health Problems"{
            print("Mental Health Problems")
            let MentalHealthProblem = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MentalHealthProblemViewController") as? MentalHealthProblemViewController
            self.navigationController?.pushViewController(MentalHealthProblem!, animated: true)
            
        }
//        else if titleLabel.text == "Meditation"{
//            print("Meditation")
//            let Meditationvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MeditationViewController") as? MeditationViewController
//
//            self.navigationController?.pushViewController(Meditationvc!, animated: true)
            
//        }
    else{
            
            print("Connect To An Expert")
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            self.navigationController?.pushViewController(CommonVC!, animated: true)
            
        }
    }
}

extension CarouselViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfSideMenuContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "SideBarTableViewCell", for: indexPath) as? SideBarTableViewCell)!
        cell.lblOfContents.text = arrOfSideMenuContents[indexPath.row].localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == 0{
            
            let BMIvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BMIViewController") as? BMIViewController
        
            self.navigationController?.pushViewController(BMIvc!, animated:true)
            
            
        }else if indexPath.row == 1 {
            let vc: FoodViewController = (storyboard?.instantiateViewController(withIdentifier: "Food") as? FoodViewController)!
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2 {
            let Meditationvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MedSound") as? MedSoundViewController
            
            self.navigationController?.pushViewController(Meditationvc!, animated: true)
            print(indexPath.row)
        }else if indexPath.row == 3{
//            let shareBtn = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
//            shareBtn.popoverPresentationController?.sourceView = self.view
//            self.present(shareBtn, animated: true,completion: nil)
            
            let items: [Any] = ["Share this content with others!"]
                
                // Create a UIActivityViewController with the items to share
                let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
                
                // If your app is on iPad, you need to specify a source view and arrow direction for the popover
                if let popoverController = activityViewController.popoverPresentationController {
                    popoverController.sourceView = self.view
                    popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                }
                
                // Present the UIActivityViewController
                self.present(activityViewController, animated: true, completion: nil)
            
        }
        
        else if indexPath.row == 4{
            do {
                        try Auth.auth().signOut()
                        print("User signed out successfully")
                        
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login") as? Login
                
                self.navigationController?.pushViewController(vc!, animated: true)
                
                        
                        // Optionally, navigate to the login screen
                        // let loginViewController = ... // instantiate your login view controller
                        // self.present(loginViewController, animated: true, completion: nil)
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }

            
        }
        else{
            print(indexPath.row)
        }
        
    }
    
}


extension CarouselViewController: CircularCarouselDelegate,CircularCarouselDataSource{
    
    
    
    func numberOfItems(inCarousel carousel: CircularCarousel) -> Int {
        return 5/* Number of carousel items */
    }
    func startingItemIndex(inCarousel carousel: CircularCarousel) -> Int {
        return 1 /* Insert starting item index */
    }
    func carousel(_: CircularCarousel, viewForItemAt indexPath: IndexPath, reuseView view: UIView?) -> UIView {
        
        var viewCarousel = view
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRect(x: 5, y: 5, width: 100, height: 100));
        
        if view == nil {
            viewCarousel = UIView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
        }
        
        viewCarousel?.backgroundColor = .white
        viewCarousel?.layer.cornerRadius = 10
        
        if indexPath.row == 0{
            imageView.image = UIImage(named:"Bottam_Icon_Placehoolder")
        }
        else if indexPath.row == 1{
            imageView.image = UIImage(named:"Stress_Small.jpg")
            
        }
        else if indexPath.row == 2{
            imageView.image = UIImage(named:"yoga_bottom")
        }
        else if indexPath.row == 3{
            imageView.image = UIImage(named:"MHP_Small.jpeg")
            
        }
//        else if indexPath.row == 4{
//            imageView.image = UIImage(named:"ten.png")
//
//        }
        else if indexPath.row == 4{
            imageView.image = UIImage(named:"doctor.png")
        }
        viewCarousel?.addSubview(imageView)
        return viewCarousel!
    }
    
    
    
    func carousel(_ carousel: CircularCarousel, didSelectItemAtIndex index: Int) {
        //        /* Handle selection of the selected carousel item */
        //
        print(index)
       
              
        if index == 0{
//            imgBackground.image = UIImage(named: "bg4.jpeg")
            print(index)
            
        }
        //
        else if index == 1 {
            
            print(index)
            
            let Questionvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "question") as? QuestionAnswerViewController
            Questionvc!.delegate = self
            
            self.navigationController?.pushViewController(Questionvc!, animated:true)
        }
        
        
        
        else if index == 2 {
            
            print(index)
            let Yogavc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Yoga") as? YogaController
            
            self.navigationController?.pushViewController(Yogavc!, animated: true)
        }
        
        
        else if index == 3{
            
            print(index)
            
            let MentalHealthProblem = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MentalHealthProblemViewController") as? MentalHealthProblemViewController
            self.navigationController?.pushViewController(MentalHealthProblem!, animated: true)
        }
        
        
        
//        else if index == 4{
//
//            print(index)
//
//            let Meditationvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MeditationViewController") as? MeditationViewController
//
//            self.navigationController?.pushViewController(Meditationvc!, animated: true)
//        }
        else if index == 4{
            print(index)
            
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "doctor") as? ExpertViewController
            
            self.navigationController?.pushViewController(CommonVC!, animated: true)
        }
    }
    
    
    @objc func bigImageTapped(_ gesture: UITapGestureRecognizer) {
            guard let index = gesture.view?.tag else {
                return
            }
            
            // Perform navigation to the new view controller based on the index
            switch index {
            case 0:
                print(index)
            case 1:
                let Questionvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "question") as? QuestionAnswerViewController
                Questionvc!.delegate = self
                
                self.navigationController?.pushViewController(Questionvc!, animated:true)
                
                
            case 2:
                print(index)
                let Yogavc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Yoga") as? YogaController
                
                self.navigationController?.pushViewController(Yogavc!, animated: true)
            case 3:
                let MentalHealthProblem = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MentalHealthProblemViewController") as? MentalHealthProblemViewController
                self.navigationController?.pushViewController(MentalHealthProblem!, animated: true)
            case 4:
                let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "doctor") as? ExpertViewController
                
                self.navigationController?.pushViewController(CommonVC!, animated: true)
            default:
                break
            }
            
            // Present or push the view controller
            // Example: navigationController?.pushViewController(viewController, animated: true)
        }
        
    
    func carousel(_ carousel: CircularCarousel, willBeginScrollingToIndex index: Int) {
        
        
        
        
         let savedLanguage = UserDefaults.standard.string(forKey: "currentLanguage")
        if savedLanguage == "hi"{
            titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 24)
        }
        
                
        
        
        print(index)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bigImageTapped(_:)))
              bigImage.addGestureRecognizer(tapGesture)
              bigImage.isUserInteractionEnabled = true
              bigImage.tag = index // Assign a tag to identify the index
        
        
        if index == 0{
            stressResultView.isHidden = true
//            imgBackground.image = UIImage(named: "bg4.jpeg")
            print(index)
            
//            titleLabel.text = "How this app can help you"
//            titleLabel.text = "How this app can help you"
//            carouselLabel.text = "How this app can help you"
//            bigImage.image = UIImage(named: "placeholede_banner_Icon")
//
//            textView.text = "• Help You Know Your Stress Level.\n• Help You Manage Your Stress.\n• Help You Know Possible Treatment You \n   Can Seek.\n• Help You De-Stress With Yoga.\n• Know About Mental Health Problem.\n• Help You Connect To An Expert.\n• Health Tips.
            
            
            titleLabel.text = "how this app".localizableString(forLocalization: savedLanguage ?? "")
            carouselLabel.text = "how this app".localizableString(forLocalization: savedLanguage ?? "")
            bigImage.image = UIImage(named: "placeholede_banner_Icon")
            
            textView.text = "help_detail".localizableString(forLocalization: savedLanguage ?? "")
            
            
            
            
            
        }
    
        if index == 1 {
//            imgBackground.image = UIImage(named: "bg5.jpeg")
            stressResultView.isHidden = false
            print(index)
//            titleLabel.text = "Are You Stressed ?"
//            carouselLabel.text = "Let Us Calculate Your Stress Levels"
//            bigImage.image = UIImage(named: "StressA.jpg")
//            textView.text = ""
            
            
            titleLabel.text = "Stress".localizableString(forLocalization: savedLanguage ?? "")
            carouselLabel.text = "let us calculate".localizableString(forLocalization: savedLanguage ?? "")
            bigImage.image = UIImage(named: "StressA.jpg")
            textView.text = ""
        }
        
        else if index == 2 {
//            imgBackground.image = UIImage(named: "bg6.jpeg")
            print(index)
            stressResultView.isHidden = true
//            titleLabel.text = "Yoga For Mental Health"
//            carouselLabel.text = "Yoga & Its Benefits"
//            bigImage.image = UIImage(named: "yoga_banner")
//            textView.text = "                    Benefits Of Yoga                                \n• Relief from depression and anxiety.\n• Reduce the effects of PTSD and similar \n   conditions.\n• Boost concentration, focus, and\n   memory.\n• Improve your mood.\n• Keep your brain young"
           
            
            titleLabel.text = "yoga mental".localizableString(forLocalization: savedLanguage ?? "")
            carouselLabel.text = "yoga mental".localizableString(forLocalization: savedLanguage ?? "")
            bigImage.image = UIImage(named: "yoga_banner")
            textView.text = "yoga detail".localizableString(forLocalization: savedLanguage ?? "")
        }
        else if index == 3 {
//            imgBackground.image = UIImage(named: "bg3.jpeg")
            print(index)
            stressResultView.isHidden = true
//            titleLabel.text = "Mental Health Problems"
//            carouselLabel.text = "Mental Health Problems"
//            bigImage.image = UIImage(named: "MHP.jpeg")
//            textView.text = "• Depression \n• Anxiety disorders. \n• Bipolar affective disorder.\n• Psychosis\n• Addiction"
//
            
            titleLabel.text = "mental health".localizableString(forLocalization: savedLanguage ?? "")
            carouselLabel.text = "mental health".localizableString(forLocalization: savedLanguage ?? "")
            bigImage.image = UIImage(named: "MHP.jpeg")
            textView.text = "mental_health_detail".localizableString(forLocalization: savedLanguage ?? "")
        }
        
//        else if index == 4 {
////            imgBackground.image = UIImage(named: "bg2.jpeg")
//            print(index)
//            stressResultView.isHidden = true
//            titleLabel.text = "Meditation"
//            carouselLabel.text = "Meditation"
//            bigImage.image = UIImage(named: "ten.png")
//            textView.text = "• Gaining a new perspective on stressful situations.\n• Building skills to manage your stress.\n• Increasing self-awareness.\n• Focusing on the present.\n• Reducing negative emotions."
//
//        }
        
        else if index == 4 {
//            imgBackground.image = UIImage(named: "bg4.jpeg")
            print(index)
            stressResultView.isHidden = true
//            titleLabel.text = "Connect To An Expert"
//            carouselLabel.text = "Connect To An Expert"
//            bigImage.image = UIImage(named: "doctor.png")
//            textView.text = "Counsellors work with clients experiencing a wide range of emotional and psychological difficulties to help them bring about effective change and/or enhance their wellbeing. Clients could have issues such as depression, anxiety, stress, loss and relationship difficulties that are affecting their ability to manage life."
//
            titleLabel.text = "expert".localizableString(forLocalization: savedLanguage ?? "")
            carouselLabel.text = "expert".localizableString(forLocalization: savedLanguage ?? "")
            bigImage.image = UIImage(named: "doctor.png")
            textView.text = "expert_detail".localizableString(forLocalization: savedLanguage ?? "")
        }
    }
    
    
    func carousel(_ carousel: CircularCarousel, spacingForOffset offset: CGFloat) -> CGFloat {
        
        return 1.1/* Based on the offset from center, adjust the spacing of the item */
    }
    
    func carousel<CGFloat>(_ carousel: CircularCarousel, valueForOption option: CircularCarouselOption, withDefaultValue defaultValue: CGFloat) -> CGFloat {
        switch option {
        case .itemWidth:
            return  defaultButtonWidth as! CGFloat
            
        case .scaleMultiplier:
            return scaleMultiplier as! CGFloat
            
        case .minScale:
            return minScale as! CGFloat
            
        case .maxScale:
            return maxScale as! CGFloat
            
        case .fadeMin:
            return minFade as! CGFloat
            
        case .fadeMax:
            return maxFade as! CGFloat
            
            
        default:
            return defaultValue
        }
    }
    
    
    
    
}
