//
//  HomeViewController+Timer.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import Foundation
extension HomeViewController {

    func startTheTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
                self.lblCountDown.text = self.timeString(time: TimeInterval(self.secondsRemaining))
            } else {
                Timer.invalidate()
            }
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%01im%02i", minutes, seconds)
    }

}
