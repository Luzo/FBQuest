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
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!

    deinit {
        print("dealloc \(self)")
    }

    override func viewDidLoad() {
        setupTableView()
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

    func setCheckButtonVisible(_ visible: Bool) {
        checkButton.isHidden = !visible
    }

    func setNextButtonVisible(_ visible: Bool) {
        nextButton.isHidden = !visible
    }

    func set(withQuestion question: Question) {
        questionDatasource.setup(withQuestion: question)
        nextButton.imageView?.tintColor = Colors.CorrectOptionBackground
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
