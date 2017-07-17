//
//  AnswerOptionTableViewCell.swift
//  FBQuest
//
//  Created by Lubos Lehota on 29/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit
import HexColors

class AnswerOptionTableViewCell: UITableViewCell {
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var optionValue: UILabel!
    @IBOutlet weak var checkImage: UILabel!

    func setupWith(answer: AnswerViewModel, answerPosition position: Int) {
        optionLabel.text = "\("a".advanceCharacter(by: UInt32(position))))"
        optionValue.text = answer.text
        setCellSelected(answer.isSelected)
    }

    func setup(asCorrect correct: Bool) {
        if isSelected {
            backgroundColor = correct ? UIColor("F0FFF0"): UIColor("FAEBD7")
        } else {
            backgroundColor = correct ? UIColor("FAEBD7") : UIColor("F0FFF0")
        }
    }

    fileprivate func setCellSelected(_ selected: Bool) {
        isSelected = selected
        checkImage.textColor = selected ? UIColor("228818") : .gray
    }
}
