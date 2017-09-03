//
//  QuestionsDatasource.swift
//  FBQuest
//
//  Created by Lubos Lehota on 29/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

enum QuestionSection: Int {
    case title
    case description
    case options
    case simpleOptions

    static var count: Int {
        return 4
    }
}

final class QuestionsDatasource: NSObject, UITableViewDataSource {
    let cellIdentifiers: [ QuestionSection: String] = [
        .options: String(describing: AnswerOptionTableViewCell.self),
        .simpleOptions: String(describing: SimpleAnswerOptionTableViewCell.self),
        .title: String(describing: ReusableTitleTableViewCell.self),
        .description: String(describing: ReusableDescriptionTableViewCell.self)
    ]

    fileprivate var answers: [AnswerViewModel] = []
    fileprivate var title: String?
    fileprivate var subtitle: String?
    fileprivate var questionType: QuestionType = .simple
    var showCorrectAnswers = false

    func setup(withQuestion question: Question) {
        title = question.title
        subtitle = question.subtitle
        questionType = question.type ?? .simple
    }

    func setup(withAnswers answers: [AnswerViewModel]) {
        self.answers = answers
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = QuestionSection(rawValue: section) else { return 0 }

        switch section {
            case .title:
                return 1
            case .options:
                return questionType == .simple ? 0 : answers.count
            case .simpleOptions:
                return questionType == .simple ? answers.count : 0
            case .description:
                return 1
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return QuestionSection.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = QuestionSection(rawValue: indexPath.section),
            let identifier = cellIdentifiers[section]
        else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        switch section {
            case .title:
                let castedCell = cell as? ReusableTitleTableViewCell
                castedCell?.titleLabel.text = title
                castedCell?.setupStyles()
            case .options:
                let castedCell = cell as? AnswerOptionTableViewCell
                castedCell?.setupWith(answer: answers[indexPath.row], answerPosition: indexPath.row)
                castedCell?.setupStyles()
                if showCorrectAnswers {
                    castedCell?.setup(asCorrect: answers[indexPath.row].isCorrect)
                }
            case .simpleOptions:
                let castedCell = cell as? SimpleAnswerOptionTableViewCell 
                castedCell?.setupWith(answer: answers[indexPath.row], answerPosition: indexPath.row)
                castedCell?.setupStyles()
                if showCorrectAnswers {
                    castedCell?.setup(asCorrect: answers[indexPath.row].isCorrect)
                }
            case .description:
                let castedCell = cell as? ReusableDescriptionTableViewCell
                castedCell?.setupStyles()
                castedCell?.descriptionLabel.text = subtitle
        }

        return cell
    }
}
