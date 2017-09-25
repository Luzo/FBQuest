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
    @IBOutlet weak var checkImage: UIImageView!

    func setupStyles() {
        checkImage.image = checkImage.image?.withRenderingMode(.alwaysTemplate)
        checkImage.tintColor = Colors.NotSelectedOptionColor
        optionLabel.font = Fonts.TextFontLight
        optionValue.font = Fonts.TextFontLight
    }

    func setupWith(answer: AnswerViewModel, answerPosition position: Int) {
        optionLabel.text = "\("a".advanceCharacter(by: UInt32(position))))"
        optionValue.text = answer.text
        setCellSelected(answer.isSelected)
    }

    func setup(asCorrect correct: Bool) {
        if isSelected {
            if correct {
                checkImage.tintColor = Colors.CorrectOptionBackground
            } else {
                checkImage.image = UIImage(named: "error")
            }
        } else if !isSelected && correct {
            checkImage.tintColor = Colors.CorrectOptionBackground
        }
    }

    fileprivate func setCellSelected(_ selected: Bool) {
        isSelected = selected
        checkImage.image = selected ? UIImage(named: "checked") : UIImage(named: "check")
    }
}
