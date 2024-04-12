//
//  LastTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 23/02/23.
//

import UIKit
protocol LastCellDelegate{
    func didSelectCollectionView(indexPath:IndexPath, collectionView:UICollectionView, delegateName: String)
}
class LastTableViewCell: UITableViewCell {
   var arrofName = ["Morning","Evening","Night"]
    var arrOfImages = ["bg5.jpeg","bg4.jpeg","bg3.jpeg","bg2.jpeg","bg5.jpeg","bg4.jpeg","bg3.jpeg","bg2.jpeg","bg5.jpeg","bg4.jpeg","bg3.jpeg","bg2.jpeg"]
    var arrTitle = [String]()
    
    var delegate:LastCellDelegate?
    @IBOutlet weak var clctionView: UICollectionView!
    @IBOutlet weak var backgroundViewOutlet: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundViewOutlet.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Initialization code
        
        clctionView.delegate = self
        clctionView.dataSource = self
        clctionView.layer.cornerRadius = 20
        clctionView.showsHorizontalScrollIndicator = false
        RegisterNib()
    }

    
    func RegisterNib(){
        clctionView.register(UINib(nibName: "LastCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "LastCollectionViewCell")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LastTableViewCell: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LastCollectionViewCell", for: indexPath) as! LastCollectionViewCell
        
        cell.backgroundImgViewOutlet.image = UIImage(named: arrOfImages[indexPath.row])
        cell.fieldNameOutlet.text = arrTitle[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item --")
        self.delegate?.didSelectCollectionView(indexPath: indexPath, collectionView: collectionView, delegateName: "Daily")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 280, height: 155)
        }
    
}


