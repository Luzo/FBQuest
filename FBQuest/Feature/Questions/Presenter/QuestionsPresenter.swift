//
//  QuestionsPresenter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 29/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//


import UIKit

protocol QuestionsView: View {
    func set(withQuestion question: Question)
    func set(withAnswers answers: [AnswerViewModel])
    func setNextButtonVisible(_ visible: Bool)
    func setCheckButtonVisible(_ visible: Bool)
    func showCorrectAnswers()
}

protocol QuestionsPresenter: Presenter {
    func closeButtonTapped()
    func checkButtonTapped()
    func nextButtonTapped()
    var selectedTopicId: Int { get set }
    var questionIndex: Int { get set }
    func selectedAnswer(atIndex index: Int)
}

final class QuestionsPresenterImpl: BasePresenter<QuestionsView> {
    fileprivate let interactor: QuestionsInteractor
    fileprivate let answersFormatter: AnswersFormatter

    fileprivate var _selectedTopicId: Int = -1
    fileprivate var questions: [Question] {
        return interactor.mappedQuestions[selectedTopicId] ?? []
    }
    fileprivate var answers: [AnswerViewModel] = []

    var questionIndex: Int = 0

    deinit {
        print("dealloc \(self)")
    }

    override func setupAfterInit() {
        view?.navigationViewController?.isNavigationBarHidden = true
        view?.setNextButtonVisible(false)
        view?.setCheckButtonVisible(false)

        loadQuestion()
    }

    init(
        interactor: QuestionsInteractor,
        appRouter: AppRouter,
        view: QuestionsView,
        answersFormatter: AnswersFormatter
    ) {
        self.interactor = interactor
        self.answersFormatter = answersFormatter

        super.init(appRouter: appRouter, view: view)
    }

    fileprivate func checkAnswer(forAnswerId answerId: Int) {

    }

    fileprivate func loadQuestion() {
        let question = questions[questionIndex]
        answers = answersFormatter.format(model: question)
        view?.set(withQuestion: question)
        view?.set(withAnswers: answers)
    }

    fileprivate func goToNextQuestion() {
        let questionViewController = appRouter.appScope.resolve(type: QuestionsViewController.self)
        questionViewController.presenter?.questionIndex = questionIndex + 1
        questionViewController.presenter?.selectedTopicId = selectedTopicId
        view?.navigationViewController?.pushViewController(questionViewController, animated: true)
    }
}

extension QuestionsPresenterImpl: QuestionsPresenter {
    var selectedTopicId: Int {
        get {
            return _selectedTopicId
        }
        set {
            _selectedTopicId = newValue
        }
    }

    func nextButtonTapped() {
        if questionIndex + 1 < questions.count {
            goToNextQuestion()
        } else {

            let doneViewController = appRouter.appScope.resolve(type: DoneViewController.self)
            doneViewController.modalPresentationStyle = .overCurrentContext
            (view as? UIViewController)?.present(doneViewController, animated: true, completion: nil)
        }
    }

    func closeButtonTapped() {
        view?.navigationViewController?.dismiss(animated: true)
    }

    func selectedAnswer(atIndex index: Int) {
        view?.setCheckButtonVisible(true)

        if questions[questionIndex].type ?? .simple == .simple {
            for index in 0 ..< answers.count { answers[index].isSelected = false }
        }

        answers[index].isSelected = !answers[index].isSelected
        view?.set(withAnswers: answers)
    }

    func checkButtonTapped() {
        view?.setNextButtonVisible(true)
        view?.setCheckButtonVisible(false)
        view?.showCorrectAnswers()
    }
}
