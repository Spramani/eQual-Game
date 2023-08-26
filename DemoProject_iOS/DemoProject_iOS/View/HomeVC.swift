//
//  HomeVC.swift
//  DemoProject_iOS
//
//  Created by Shubham on 22/08/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var selectedCellIndex:[Int] = [Int]()
    var alreadySelectedlCelIndex:[Int] = [Int]()
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.reloadData()
        }
    }
    
    var listOfNumber:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
}

extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfNumber.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        
        cell.setup(data:listOfNumber[indexPath.row],selectdIndex: selectedCellIndex.contains(where: {$0 == indexPath.row}) ? true : false)
        
        if selectedCellIndex.contains(where: {$0 == indexPath.row}) && selectedCellIndex.count == 2 {
            cell.compairdata(data:listOfNumber,firstSelectedData: selectedCellIndex.first!, secondSelectedData: selectedCellIndex.last!) { [self] status in
                if status {
                    if alreadySelectedlCelIndex.contains(where: {$0 == selectedCellIndex.first! }) {}else{
                        alreadySelectedlCelIndex.append(selectedCellIndex.first!) }
                    if alreadySelectedlCelIndex.contains(where: {$0 == selectedCellIndex.last! }) {}else{
                        alreadySelectedlCelIndex.append(selectedCellIndex.last!) }
                }
            }
            
        }else{
            cell.backView.backgroundColor = .white
            cell.confirmSelectdList(selcted: alreadySelectedlCelIndex.contains(where: {$0 == indexPath.row}) ? true : false)
        }
        
        if alreadySelectedlCelIndex.count == listOfNumber.count {
            alretView()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedCellIndex.count < 2 {
            if selectedCellIndex.contains(where: {$0 == indexPath.row }) {
                guard let index = selectedCellIndex.firstIndex(where: {$0 == indexPath.row }) else {return}
                selectedCellIndex.remove(at: index)
            }else{
                selectedCellIndex.append(indexPath.row)
            }
        }else{
            selectedCellIndex = []
            selectedCellIndex.append(indexPath.row)
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/7 - 10, height: UIScreen.main.bounds.width/7 - 10)
    }
}

extension HomeVC {
    func alretView(){
        let alert = UIAlertController(title: "Hurry!", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Start from Begining", style: .default, handler: { action in
            self.selectedCellIndex = []
            self.alreadySelectedlCelIndex = []
            self.collectionView.reloadData()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
