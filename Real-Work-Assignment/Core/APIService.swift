//
//  APIService.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import Foundation

class APIService {
    func getContent(completion: @escaping (ForYouModel) -> ()) {
        guard let url = URL(string: HomeAPI.ForYouGet.rawValue)
            else { fatalError("URL is not correct!") }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            let content = try! JSONDecoder().decode(ForYouModel.self, from: data)
            DispatchQueue.main.async {
//                print(content)
                completion(content)
            }
        }.resume()
    }
    
    func getAnswer(id: Int, completion: @escaping (AnswerReveal) -> ()) {
        guard let url = URL(string: HomeAPI.GetAnswer.rawValue + "\(id)")
            else { fatalError("URL is not correct!") }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            let content = try! JSONDecoder().decode(AnswerReveal.self, from: data)
            DispatchQueue.main.async {
                print(content)
                completion(content)
            }
        }.resume()
    }
}
