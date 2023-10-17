//
//  ForYouModel.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import Foundation

struct ForYouModel: Codable {
    var type: String = ""
    var id: Int = 0
    var playlist: String = ""
    var description: String = ""
    var image: String = ""
    var question: String = ""

    var options: [ForYouOptions] = [ForYouOptions]()
    var user: ForYouUser = ForYouUser()
}

struct ForYouOptions: Codable {
    var id: String = ""
    var answer: String = ""
}

struct ForYouUser: Codable {
    var name: String = ""
    var avatar: String = ""
}
