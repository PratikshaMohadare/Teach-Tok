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
//    var currentContent = ForYouModel()
    var correctAnswer : ForYouOptions?
    var secondsRemaining = 600

    @IBOutlet weak var collectionViewHome: UICollectionView!
    @IBOutlet weak var lblCountDown: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionViewHome.delegate = self
        self.collectionViewHome.reloadData()
        
        self.callApi()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.startTheTimer()
        })
    }
        
    func callApi() {
        self.startActivityIndicator()
        
        APIService().getContent { model in
//            self.currentContent = model
            self.arrForYou.append(model)
            self.correctAnswer = nil
            self.collectionViewHome.reloadData()
            
            self.activityIndicator.stopAnimating()
        }
    }
}
