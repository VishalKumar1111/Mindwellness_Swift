//
//  CollectionTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 23/02/23.
//

import UIKit

protocol AnxityDelegate{
    func didSelectCollectionView(indexPath:IndexPath, collectionView:UICollectionView, delegateName: String)
}

class CollectionTableViewCell: UITableViewCell {
 var arrOfName = ["Depression","Anxiety","Addiction","Psychosis","Bipolar Disorder","Other Psychotic"]
    var arrOfImages = ["bg2.jpeg","bg3.jpeg","bg4.jpeg","bg5.jpeg","bg2.jpeg","bg3.jpeg","bg4.jpeg","bg5.jpeg","bg2.jpeg","bg3.jpeg","bg4.jpeg","bg5.jpeg"]
    var countDepression = 0
    var arrName = [String]()
    @IBOutlet weak var clctionView: UICollectionView!
    @IBOutlet weak var backgroundViewOutlet: UIView!
    var delegate:AnxityDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Initialization code
        clctionView.delegate = self
        clctionView.dataSource = self
        clctionView.showsHorizontalScrollIndicator = false
        RegisterNib()
    }

    func RegisterNib(){
        clctionView.register(UINib(nibName: "FieldCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "FieldCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FieldCollectionViewCell", for: indexPath) as! FieldCollectionViewCell
        cell.backgroundImgView.image = UIImage(named: arrOfImages[indexPath.row])
        cell.tag = indexPath.row
//        cell.fieldImgViewOutlet.image = arrName[indexPath.row] as? UIImage
        cell.fieldNameOutlet.text = arrName[indexPath.row] as? String
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelectCollectionView(indexPath: indexPath, collectionView: collectionView, delegateName: "Popular")
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 155)
    }
    
    
}
