//
//  QuestionsViewController.swift
//  FBQuest
//
//  Created by Lubos Lehota on 29/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

final class QuestionsViewController: BaseViewController<QuestionsPresenter> {

    @IBOutlet weak var contentHolder: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    deinit {
        print("dealloc \(self)")
    }

    override func viewDidLoad() {
        setupTableView()
    }

    fileprivate func setupTableView() {
        tableView.estimatedRowHeight = 44
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        [
            String(describing: AnswerOptionTableViewCell.self),
            String(describing: ReusableTitleTableViewCell.self),
            String(describing: ReusableDescriptionTableViewCell.self)
        ].forEach {
            tableView.register(UINib.init(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
    }
}

extension QuestionsViewController: QuestionsView {

}

extension QuestionsViewController: UITableViewDelegate {}
