//
//  UIImageView+Extension.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(url: String) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.cachePolicy = .returnCacheDataElseLoad
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
}
