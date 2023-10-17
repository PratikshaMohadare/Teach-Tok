//
//  HomeViewController+CollectionView.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import Foundation
import UIKit

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrForYou.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.data = arrForYou[indexPath.row]
//        cell.data = currentContent
        cell.ansDelegate = self
        cell.correctAnswer = self.correctAnswer
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == arrForYou.count - 1 { //} && arrForYou.count < totalCount {
            callApi()

//            pageCount += 1
            // Call API here
//            self.callApi()
        }
    }
}
