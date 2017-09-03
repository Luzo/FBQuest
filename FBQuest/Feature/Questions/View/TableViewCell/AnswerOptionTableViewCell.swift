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
    @IBOutlet weak var checkImage: BorderedLabelView!

    func setupStyles() {
        optionLabel?.font = Fonts.TextFontLight
        optionValue?.font = Fonts.TextFontLight
    }

    func setupWith(answer: AnswerViewModel, answerPosition position: Int) {
        optionLabel.text = "\("a".advanceCharacter(by: UInt32(position))))"
        optionValue.text = answer.text
        setCellSelected(answer.isSelected)
    }

    func setup(asCorrect correct: Bool) {
        if isSelected {
            backgroundColor = correct ? Colors.CorrectOptionBackground : Colors.IncorrectOptionBackground
        } else if !isSelected && correct {
            backgroundColor = Colors.CorrectOptionBackground
        }
    }

    fileprivate func setCellSelected(_ selected: Bool) {
        isSelected = selected
        checkImage.borderColor = selected ? Colors.SelectedOptionColor : Colors.NotSelectedOptionColor
    }
}
