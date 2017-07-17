//
//  AnswersFormatter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 15/07/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

class AnswersFormatter: Formatter<Question, [AnswerViewModel]>  {
    override func format(model: Question) -> [AnswerViewModel] {
        guard let answers = model.answers else { return [] }

        return answers.map {
            let isCorrect = $0.optionId.flatMap { model.correctAnswers?.contains($0) } ?? false
            return AnswerViewModel(text: $0.option ?? "", isSelected: false, isCorrect: isCorrect)
        }
    }
}
