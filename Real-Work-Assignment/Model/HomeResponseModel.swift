//
//  HomeResponseModel.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import Foundation

struct AnswerReveal: Codable {
    var id: Int = 0

    var correct_options: [ForYouOptions] = [ForYouOptions]()
}
