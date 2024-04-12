//
//  IntroViewController.swift
//  MindWellness
//
//  Created by iOS Training on 22/07/21.
//

import UIKit

class IntroViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lblTextIntroScreen: UILabel!
    
    var introDataDictArray = [Dictionary<String, String>]()
    var index = 0
    var arrTextNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.layer.cornerRadius = 10
        imgView.layer.cornerRadius = 20
       
        lblTextIntroScreen.layer.cornerRadius = 10
            lblTextIntroScreen.layer.masksToBounds = true
        introDataDictArray = [
                              ["imgname": "eight.jpg", "bckColor": "fbb90d"],
                             ["imgname": "two.jpg", "bckColor": "f9606b"],
            ["imgname": "three.jpg", "bckColor": "22ceb2"],
            ["imgname": "four.jpg", "bckColor": "f058dd"],
            ["imgname": "five.jpg", "bckColor": "5ddb6b"]]
     
        arrTextNames = ["Helping You To Fight Depression" , "Helping You To Combat Addiction" , " Helping You To Fight Bipolar" , "Helping You To Fight Anxiety and Panic"]
        
        self.imgView.image = UIImage(named: introDataDictArray[index]["imgname"]!)
       // self.imgView.frame = self.view.bounds
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
               swipeRight.direction = UISwipeGestureRecognizer.Direction.right
               self.view.addGestureRecognizer(swipeRight)
       
               let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
               swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
               self.view.addGestureRecognizer(swipeLeft)
        
        pageControl.numberOfPages = introDataDictArray[index]["imgname"]!.count
        lblTextIntroScreen.text! = arrTextNames[index]
    }

    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizer.Direction.right:
                //write your logic for right swipe
               // UnpackLogger.smartLog("Swiped right")
                self.swipeLeft()
                
            case UISwipeGestureRecognizer.Direction.left:
                //write your logic for left swipe
               // UnpackLogger.smartLog("Swiped left")
                self.swipeRight()
                
            default:
                break
            }
        }
    }

    func swipeRight() {
        if  (index >= 3 ) {
            
            self.view.removeFromSuperview()
            
        }
        
        else
        {
          index = index + 1
        
            self.imgView.image = UIImage(named: introDataDictArray[index]["imgname"]!)
            pageControl.currentPage = index
            lblTextIntroScreen.text! = arrTextNames[index]
            print(index)
       
        }
    }
    func swipeLeft() {
        
        if (index > 0 ){
            index = index - 1
            self.imgView.image = UIImage(named: introDataDictArray[index]["imgname"]!)
            lblTextIntroScreen.text! = arrTextNames[index]
            pageControl.currentPage = index
        }
        if (index == 0) {
            self.imgView.image = UIImage(named: introDataDictArray[index]["imgname"]!)
            pageControl.currentPage = index
        }
        
    }

        
    }
    
