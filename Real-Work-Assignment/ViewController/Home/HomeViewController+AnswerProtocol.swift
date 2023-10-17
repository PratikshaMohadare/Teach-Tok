//
//  HomeViewController+AnswerProtocol.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import Foundation

extension HomeViewController : AnswerSelectedProtocol {
    func answerSelected(_ answer: ForYouOptions, questionId: Int) {
        self.startActivityIndicator()
        APIService().getAnswer(id: questionId) { correctAns in
            print(correctAns.id)
            
            let correctOP = correctAns.correct_options
            self.correctAnswer = correctOP[0]
            self.collectionViewHome.reloadData()
            self.stopActivityIndicator()
        }
    }
}
