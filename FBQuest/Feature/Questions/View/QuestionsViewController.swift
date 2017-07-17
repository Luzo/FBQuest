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
    let questionDatasource = QuestionsDatasource()
    
    deinit {
        print("dealloc \(self)")
    }

    override func viewDidLoad() {
        setupTableView()
        contentHolder.layer.shadowColor = UIColor.black.cgColor
        contentHolder.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentHolder.layer.shadowOpacity = 0.8
    }

    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = questionDatasource
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        [
            String(describing: AnswerOptionTableViewCell.self),
            String(describing: SimpleAnswerOptionTableViewCell.self),
            String(describing: ReusableTitleTableViewCell.self),
            String(describing: ReusableDescriptionTableViewCell.self)
        ].forEach {
            tableView.register(UINib.init(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
        tableView.separatorStyle = .none
    }

    @IBAction func didTapOnNextButton(_ sender: UIButton) {
        presenter?.nextButtonTapped()
    }

    @IBAction func didTapOnCloseButton(_ sender: UIButton) {
        presenter?.closeButtonTapped()
    }
    
    @IBAction func didTapOnCheckButton(_ sender: Any) {
        presenter?.checkButtonTapped()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectedAnswer(atIndex: indexPath.row)
    }
}

extension QuestionsViewController: QuestionsView {
    func set(withQuestion question: Question) {
        questionDatasource.setup(withQuestion: question)
        tableView.allowsMultipleSelection = (question.type ?? .simple) == .multiple
        tableView.reloadData()
    }

    func set(withAnswers answers: [AnswerViewModel]) {
        questionDatasource.setup(withAnswers: answers)
        tableView.reloadData()
    }

    func showCorrectAnswers() {
        questionDatasource.showCorrectAnswers = true
        tableView.reloadData()
    }
}

extension QuestionsViewController: UITableViewDelegate {}
