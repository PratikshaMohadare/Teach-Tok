//
//  HomeViewController.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import UIKit

class HomeViewController: UIViewController {

    var arrForYou = [ForYouModel]()
    var totalCount = 0
    var currentContent = ForYouModel()
    var correctAnswer : ForYouOptions?

    @IBOutlet weak var collectionViewHome: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionViewHome.delegate = self
        self.callApi()
    }
        
    func callApi() {
        APIService().getContent { model in
            self.currentContent = model
            self.arrForYou.append(model)
            self.correctAnswer = nil
            self.collectionViewHome.reloadData()
        }
    }
}

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrForYou.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
//        cell.data = arrForYou[indexPath.row]
        cell.data = currentContent
        cell.ansDelegate = self
        cell.correctAnswer = self.correctAnswer
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == arrForYou.count - 1 && arrForYou.count < totalCount {
//            pageCount += 1
            // Call API here
//            self.callApi()
        }
    }
}

extension HomeViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(self.collectionViewHome.contentOffset.y >= (self.collectionViewHome.contentSize.height - self.collectionViewHome.bounds.size.height)) {
            callApi()
//            if !isPageRefreshing {
//                isPageRefreshing = true
//                print(page)
//                page = page + 1
//                YourApi(page1: page)
//            }
        }
    }
}

extension HomeViewController : AnswerSelectedProtocol {
    func answerSelected(_ answer: ForYouOptions, questionId: Int) {
        APIService().getAnswer(id: questionId) { correctAns in
            print(correctAns.id)
            
            let correctOP = correctAns.correct_options
            self.correctAnswer = correctOP[0]
            self.collectionViewHome.reloadData()
            
            
        }
    }
}
