//
//  CategoyViewConttroler.swift
//  CollecationView
//
//  Created by R88 on 16/01/23.
//

import Foundation
import UIKit

struct MobileItem{
    var id: Int
    var name: String
    var model: String
    var price: Int
}

class CategoryViewController: UIViewController{

@IBOutlet weak var mobileItemCollecationView: UICollectionView!
var arrMobileItem: [MobileItem] = []
var selectedIndex: Int = -1
var numberOfItemInRow: Int = 2
var interItemSapce: CGFloat = 16

override func viewDidLoad() {
    
    super.viewDidLoad()
    setup()
}

private func setup(){
    loadMobileItems()
    configerCategoryCollecationView()
}

private func loadMobileItems(){
    let apple: MobileItem = MobileItem(id: 1, name: "apple", model: "11", price: 5000)
    let samsung: MobileItem = MobileItem(id: 2, name: "samsung", model: "s22 Ultra", price: 12000)
    let mi: MobileItem = MobileItem(id: 3, name: "mi", model: "11", price: 5000)
    let vivo: MobileItem = MobileItem(id: 4, name: "vivo", model: "11", price: 5000)
    let onePlus: MobileItem = MobileItem(id: 5, name: "onePlus", model: "11", price: 5000)
    arrMobileItem = [apple, samsung, mi, vivo, onePlus]
  }
    private func configerCategoryCollecationView(){
        let nibFile: UINib = UINib(nibName: "MobileCollectionViewCell", bundle: nil)
        mobileItemCollecationView.register(nibFile, forCellWithReuseIdentifier: "MobileCollectionViewCell")
    }
    
    
}

extension CategoryViewController: UICollectionViewDataSource {

func numberOfSections(in collectionView: UICollectionView) -> Int {
   return 1
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrMobileItem.count
    }


func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MobileCollectionViewCell", for: indexPath) as! MobileCollectionViewCell
    let abc = arrMobileItem[indexPath.row]
    cell.nameLabel.text = "\(abc.id) &                  \(abc.price)"

    cell.layer.backgroundColor = UIColor.orange.cgColor
    cell.layer.borderWidth = 1
    cell.layer.cornerRadius = 10
    cell.layer.masksToBounds = true
    print(indexPath.row)
    
    if indexPath.row == selectedIndex {
        let cell = UIColor.orange.cgColor
    } else {
        let cell = UIColor.blue.cgColor
    }
    return cell
 }

}

extension CategoryViewController: UICollectionViewDelegate {
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
}
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout{

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if indexPath.section == 0{
        let spacing = CGFloat(numberOfItemInRow+1) * interItemSapce
        let avilabelWidth = collectionView.frame.width - spacing
        let cellWidth = avilabelWidth / CGFloat(numberOfItemInRow)
        return CGSize(width: cellWidth, height: cellWidth)
    } else {
        let spacing = CGFloat(numberOfItemInRow+1) * interItemSapce
        let avilabelWidth = collectionView.frame.width - spacing
        let cellWidth = avilabelWidth / CGFloat(numberOfItemInRow)
        return CGSize(width: cellWidth, height: 80)
    }
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
    }

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 16
}


}
