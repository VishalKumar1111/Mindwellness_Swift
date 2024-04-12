//
//  MentalHealthViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 23/08/22.
//

import UIKit
import WebKit
import AVFoundation

class MentalHealthViewController: UIViewController, WKUIDelegate, WKNavigationDelegate{
   
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var arrOfVideo = ["Sukhasana","Balasana", "Adho Mukha Svanasana", " Salamba Sarvangasana" , "Savasana"]
    var arrOfText = ["Sukhasana","Balasana", "Adho Mukha Svanasana", " Salamba Sarvangasana" , "Savasana"]
    var arrfromPlist: NSArray?
    var showTextData = ""
    var arrOfThumbnail: NSArray?
    var selectedindex = -1
    var iscollapse = false
    
//Array FOR TAKE DATA FROM MHPVC
    // STARTING
    var CheckSourceOFData = ""
    var arrOfImgFromMHPVC = String()
    var arrOfDetailFromMHPVC = String()
    var arrOfVideoLink = String()
    var arrOfProblemTopicHeading = [String]()
    var arrOfDataFromMHPVC : NSArray?
    var HeadingLblNameOfView = String()
    //ENDING POINT
    @IBOutlet weak var titlebackground: UIView!
    
   
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var headinglbl: UILabel!
    @IBOutlet weak var VideoBtn: UIButton!
    @IBOutlet weak var textBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtlbl: UILabel!
    @IBOutlet weak var vdolbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
            self.titlebackground.insertSubview(imageView, at: 0)
            
        }
//        self.titlebackground.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
       // self.viewTitle.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        //self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
       
        registerNibs()
        webView.isHidden = true
        
        if CheckSourceOFData == "MHPVC"{
            
            headinglbl.text = HeadingLblNameOfView
        }else{
            
            headinglbl.text = "Yoga & It's Benefits"
        }
        if let path = Bundle.main.path(forResource: "Yoga Data", ofType: "plist") {
            arrfromPlist = NSArray(contentsOfFile: path)
            print(arrfromPlist as Any)
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    func registerNibs() {
        
        let backgroundNib = UINib(nibName: "YogaTableViewCell", bundle:nil)
        self.tableView!.register(backgroundNib, forCellReuseIdentifier: "YogaTableViewCell")
        
        let backgroundNib1 = UINib(nibName: "YogaVideoTableViewCell", bundle:nil)
        self.tableView!.register(backgroundNib1, forCellReuseIdentifier: "YogaVideoTableViewCell")
        
        let textbackgroundNib = UINib(nibName: "YogaTextTableViewCell", bundle:nil)
        self.tableView!.register(textbackgroundNib, forCellReuseIdentifier: "YogaTextTableViewCell")
        
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
        if CheckSourceOFData == "MHPVC"{
            
            self.navigationController?.popViewController(animated: true)
        }else{
            
            self.navigationController?.popToRootViewController(animated: true)
        
        }
    }
    
}


let imageCache = NSCache<NSString, AnyObject>()
extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(_ originalString: String) {
        
        self.image = nil
        guard let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    
                    self.image = downloadedImage
                }
            })
            
        }).resume()
    }
    
}



extension MentalHealthViewController: UITableViewDataSource, UITableViewDelegate{
 
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
    if CheckSourceOFData == "MHPVC"{
        
        return arrOfProblemTopicHeading.count
    }else{
          return arrOfVideo.count
    }
    
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if CheckSourceOFData == "MHPVC"{
            return 230
        }else{
            return 330
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if CheckSourceOFData == "MHPVC"{ //This Data is for Mental Health View Controller
            
            let dic = arrOfDataFromMHPVC![indexPath.row] as? NSDictionary
            let Url = dic?["UTubeLink"] as? String
            let Image = dic?["Thumbnail"] as? String
            let Detail = dic?["Detail"] as? String
            let name = arrOfProblemTopicHeading[indexPath.row]
            print(Url ?? "")
            if Url == nil{
                
                let alert = UIAlertController(title: "Video Not Found", message: "We Are Working On This. Sorry For Your Inconvenience", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let myURL = URL(string: Url ?? "")
                let myRequest = URLRequest(url: myURL!)
                print(myRequest)
                webView.load(myRequest)
                webView.uiDelegate = self
                webView.navigationDelegate = self
                webView.isHidden = false
                webView.isHidden = true
            }
            
        }else{
            let dic = arrfromPlist?[indexPath.row] as? NSDictionary
            let Url = dic?["VideoUrl"] as? String
            let name = dic?["YogaName"] as? String
            print(Url ?? "")
            
            let myURL = URL(string: Url ?? "")
            let myRequest = URLRequest(url: myURL!)
            print(myRequest)
            webView.load(myRequest)
            webView.uiDelegate = self
            webView.navigationDelegate = self
            webView.isHidden = false
            webView.isHidden = true
            
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // DATA Of MHPVC
        if CheckSourceOFData == "MHPVC"{
            
            
            if showTextData == "Yes"
            {
                
                var cell: YogaTextTableViewCell = tableView.dequeueReusableCell(withIdentifier: "YogaTextTableViewCell", for: indexPath) as! YogaTextTableViewCell
                
                let dic = arrOfDataFromMHPVC![indexPath.row] as? NSDictionary
                let Image = dic?["Thumbnail"] as? String
                let Detail = dic?["Detail"] as? String
                let name = arrOfProblemTopicHeading[indexPath.row]
                cell.imageOfTextSide.loadImageUsingCacheWithUrlString("https://img.youtube.com/vi/\(Image ?? "")/mqdefault.jpg")
                cell.aasanNamelbl.text = name
                cell.aasanDetailsTextView.text = Detail
                
                return cell
            }else{
                var cell: YogaVideoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "YogaVideoTableViewCell", for: indexPath) as! YogaVideoTableViewCell
                let dic = arrOfDataFromMHPVC![indexPath.row] as? NSDictionary
                let Detail = dic?["Detail"] as? String
                let Image = dic?["Thumbnail"] as? String
                cell.cellImage.loadImageUsingCacheWithUrlString("https://img.youtube.com/vi/\(Image ?? "")/mqdefault.jpg")
                let name = arrOfProblemTopicHeading[indexPath.row]
                cell.lblofName.text = name
                //            cell.aasanDetailsTextLblOlt.text = Detail
                cell.selectionStyle = .none
                return cell
            }
        }else{
            //DATA OF Yoga VC
            
            var cell: YogaVideoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "YogaVideoTableViewCell", for: indexPath) as! YogaVideoTableViewCell
            let dic = arrfromPlist?[indexPath.row] as? NSDictionary
            let name = dic?["YogaName"] as? String
            let Detail = dic?["Detail"] as? String
            let Image = dic?["Image"] as? String
            cell.cellImage.loadImageUsingCacheWithUrlString("https://img.youtube.com/vi/\(Image ?? "")/mqdefault.jpg")
            cell.lblofName.text = name
            cell.aasanDetailsTextLblOlt.text = Detail
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
           print("Start Request")
        loader.isHidden = false
       }
       
       func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
           print("Failed Request")
       }
       
       func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
           print("Finished Request")
           loader.isHidden = true
       }


}

