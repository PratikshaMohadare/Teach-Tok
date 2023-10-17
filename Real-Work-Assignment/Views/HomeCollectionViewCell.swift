//
//  HomeCollectionViewCell.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblPlaylist: UILabel!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var tableViewAnswers: UITableView!
    @IBOutlet weak var imageViewBackground: UIImageView!

    weak var ansDelegate: AnswerSelectedProtocol!
    var correctAnswer : ForYouOptions?
    var selectedAnswer : ForYouOptions?

    var data : ForYouModel? {
        didSet {
            guard let data = data else {return}
            
            lblQuestion.text = data.question
            lblDescription.text = data.description
            lblUser.text = data.user.name
            lblPlaylist.text = data.playlist
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
            
            let string = NSMutableAttributedString(string: data.question, attributes: [NSAttributedString.Key.backgroundColor: UIColor.black.withAlphaComponent(0.5),
                NSAttributedString.Key.paragraphStyle: paragraphStyle])
            lblQuestion.attributedText = string
            
            imageViewBackground.loadImage(url: data.image)
            
            tableViewAnswers.reloadData()
        }
    }
}

extension HomeCollectionViewCell : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : HomeAnswerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeAnswerTableViewCell", for: indexPath) as! HomeAnswerTableViewCell
        if let thisObject = data?.options[indexPath.row] {
            cell.lblAnswer.text = thisObject.answer
            
            cell.imgThumb.isHidden = true
            cell.viewBackground.backgroundColor = UIColor(named: "neutralColor")
            
            guard let correctAns = self.correctAnswer else { return cell }
            
            guard let selectedAns = self.selectedAnswer else { return cell }

            if (correctAns.id == thisObject.id) && (thisObject.id == selectedAns.id) {
                cell.imgThumb.isHidden = false
                cell.imgThumb.image = UIImage.init(named: "Rectanglecorrect")
                cell.viewBackground.backgroundColor = UIColor(named: "correctColor")
            } else if (thisObject.id == selectedAns.id) && (thisObject.id != correctAns.id) {
                cell.imgThumb.isHidden = false
                cell.imgThumb.image = UIImage.init(named: "Rectangleincorrect")
                cell.viewBackground.backgroundColor = UIColor(named: "incorrectColor")
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let option = data?.options[indexPath.row] {
            selectedAnswer = option
            ansDelegate.answerSelected(option, questionId: data?.id ?? 0)
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
