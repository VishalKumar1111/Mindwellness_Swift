//
//  AasanTextViewController.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 19/12/22.
//

import UIKit
import WebKit
import AVFoundation
class AasanTextViewController: UIViewController,WKUIDelegate, WKNavigationDelegate, UIAlertViewDelegate {
    var headingName = String()
    var aasanImage = String()
    var showAasandetails = String()
    var WebUrl = String()
    
    var CheckForShowingData = ""
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var aasanNameLbl: UILabel!
    @IBOutlet weak var aasanImageView: UIImageView!
    @IBOutlet weak var showAasanData: UITextView!
    @IBOutlet weak var videoWebView: UIWebView!
    @IBOutlet weak var viewForShowVideo: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
        backBtn.isHidden = true
        print(CheckForShowingData)
    //    aasanImageView.image = UIImage(named: "depression.jpg")
        
        if CheckForShowingData == "Text"{
            viewForShowVideo.isHidden = true
            aasanNameLbl.text = headingName
            
        }
        else{
           
            viewForShowVideo.isHidden = false
            let myURL = URL(string: WebUrl ?? "")
            if myURL == nil{
                
                let button2Alert: UIAlertView = UIAlertView(title: "URL Not Found", message: "",
                                     delegate: self, cancelButtonTitle: "OK")
                
            }else{
           let myRequest = URLRequest(url: myURL!)
            videoWebView.loadRequest(myRequest)
        }
        }
        aasanNameLbl.text = headingName
        let image = aasanImage
        let imageAasan = image as? UIImage
        aasanImageView.image = imageAasan
        
        showAasanData.text = showAasandetails

    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
