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

    static var count: Int {
        return 3
    }
}

class QuestionsDatasource: NSObject, UITableViewDataSource {
    let cellIdentifiers: [QuestionSection: String] = [
        .options: String(describing: AnswerOptionTableViewCell.self),
        .title: String(describing: ReusableTitleTableViewCell.self),
        .description: String(describing: ReusableDescriptionTableViewCell.self)
    ]

    fileprivate var answers: [Answer] = []
    fileprivate var title: String?
    fileprivate var subtitle: String?

    func setup(witQuestion question: Question) {
        answers = question.answers ?? []
        title = question.title
        subtitle = question.subtitle
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = QuestionSection(rawValue: section) else { return 0 }

        switch section {
            case .title:
                return 1
            case .options:
                return answers.count
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
            case .options:
                let castedCell = cell as? AnswerOptionTableViewCell
                castedCell?.setupWith(answer: answers[indexPath.row], answerPosition: indexPath.row)
            case .description:
                let castedCell = cell as? ReusableDescriptionTableViewCell
                castedCell?.descriptionLabel.text = title
        }

        return cell
    }
}
