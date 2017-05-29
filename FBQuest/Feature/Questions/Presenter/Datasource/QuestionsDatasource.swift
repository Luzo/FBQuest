//
//  QuestionsDatasource.swift
//  FBQuest
//
//  Created by Lubos Lehota on 29/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

enum QuestionSection: Int {
    case Title
    case Description
    case Options

    static var count: Int {
        return 3
    }
}

class QuestionsDatasource: NSObject, UITableViewDataSource {
    let cellIdentifiers: [QuestionSection: String] = [
        .Options: String(describing: AnswerOptionTableViewCell.self),
        .Title: String(describing: ReusableTitleTableViewCell.self),
        .Description: String(describing: ReusableDescriptionTableViewCell.self)
    ]
    var menuItems: [String] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
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
            case .Title:
                let castedCell = cell as? ReusableTitleTableViewCell
            case .Options:
                let castedCell = cell as? AnswerOptionTableViewCell
            case .Description:
                let castedCell = cell as? ReusableDescriptionTableViewCell
        }

        return cell
    }
}
