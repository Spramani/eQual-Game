//
//  HomeCell.swift
//  DemoProject_iOS
//
//  Created by Shubham on 22/08/23.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
//    var tapHandler:(()->())?
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    func setup(data:Int,selectdIndex:Bool){
        titleLabel.text = "\(data)"
        titleLabel?.isHidden = selectdIndex ? false : true
        
    }
    
    func compairdata(data:[Int],firstSelectedData:Int,secondSelectedData:Int, completion: @escaping (Bool)->()){
        
        backView.backgroundColor = data[firstSelectedData] == data[secondSelectedData] ? .green : .white
        completion(data[firstSelectedData] == data[secondSelectedData] ? true : false)
        
    }
    func confirmSelectdList(selcted:Bool){
        backView.backgroundColor = selcted ? .green : .white
        if selcted {
            titleLabel.isHidden = false
        }
      //  titleLabel.isHidden = selcted ? false : true
    }

}
