//
//  QuestionsPresenter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 29/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//


import UIKit

protocol QuestionsView: View {

}

protocol QuestionsPresenter: Presenter {

}

final class QuestionsPresenterImpl: BasePresenter<QuestionsView> {
    fileprivate var interactor: QuestionsInteractor?

    override func setupAfterInit() {
    }

    init(interactor: QuestionsInteractor, appRouter: AppRouter, view: QuestionsView) {
        self.interactor = interactor
        super.init(appRouter: appRouter, view: view)
    }

}

extension QuestionsPresenterImpl: QuestionsPresenter {
}
