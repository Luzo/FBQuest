//
//  AnswerOptionTableViewCell.swift
//  FBQuest
//
//  Created by Lubos Lehota on 29/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

class AnswerOptionTableViewCell: UITableViewCell {
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var optionValue: UILabel!
    @IBOutlet weak var checkImage: UILabel!

    func setupWith(answer: Answer, answerPosition position: Int) {
        optionLabel.text = "\("a".advanceCharacter(by: UInt32(position))))"
        optionValue.text = answer.option
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        checkImage.textColor = isSelected ? .blue : .gray
        // Configure the view for the selected state
    }
}
