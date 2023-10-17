//
//  HomeAnswerTableViewCell.swift
//  Real-Work-Assignment
//
//  Created by Pratiksha on 17/10/23.
//

import UIKit

class HomeAnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAnswer: UILabel!
    @IBOutlet weak var imgThumb: UIImageView!
    @IBOutlet weak var viewBackground: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
