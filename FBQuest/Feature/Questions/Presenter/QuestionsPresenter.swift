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
}

protocol QuestionsPresenter: Presenter {
    func closeButtonTapped()
    func nextButtonTapped()
    var selectedTopicId: Int { get set }
    var questionIndex: Int { get set }

}

final class QuestionsPresenterImpl: BasePresenter<QuestionsView> {
    fileprivate var interactor: QuestionsInteractor
    fileprivate var _selectedTopicId: Int = -1
    fileprivate var questions: [Question] {
        return interactor.mappedQuestions[selectedTopicId] ?? []
    }
    var questionIndex: Int = 0

    deinit {
        print("dealloc \(self)")
    }

    override func setupAfterInit() {
        view?.navigationViewController?.isNavigationBarHidden = true
        loadQuestion()
    }

    init(interactor: QuestionsInteractor, appRouter: AppRouter, view: QuestionsView) {
        self.interactor = interactor

        super.init(appRouter: appRouter, view: view)
    }

    fileprivate func checkQuestion() {
        
    }

    fileprivate func loadQuestion() {
        view?.set(withQuestion: questions[questionIndex])
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
        let nextIndex = questionIndex + 1
        if nextIndex < questions.count {
            let questionViewController = appRouter.appScope.resolve(type: QuestionsViewController.self)
            questionViewController.presenter?.questionIndex = nextIndex
            questionViewController.presenter?.selectedTopicId = selectedTopicId
            view?.navigationViewController?.pushViewController(questionViewController, animated: true)
        } else {
            let doneViewController = appRouter.appScope.resolve(type: DoneViewController.self)
            (view as? UIViewController)?.present(doneViewController, animated: true, completion: nil)
        }
    }

    func closeButtonTapped() {
        view?.navigationViewController?.dismiss(animated: true)
    }
}
