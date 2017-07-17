//
//  SimpleAnswerOptionTableViewCell.swift
//  FBQuest
//
//  Created by Lubos Lehota on 15/07/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit
import HexColors

class SimpleAnswerOptionTableViewCell: AnswerOptionTableViewCell {

    override func setup(asCorrect correct: Bool) {
        if isSelected {
            backgroundColor = correct ? UIColor("F0FFF0") : UIColor("FAEBD7")
        } else if !isSelected && correct {
            backgroundColor = UIColor("F0FFF0")
        }
    }
}
