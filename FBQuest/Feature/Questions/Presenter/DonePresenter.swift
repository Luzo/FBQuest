//
//  DonePresenter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

protocol DoneView: View {}

protocol DonePresenter: Presenter {
    func doneButtonTapped()
}

final class DonePresenterImpl: BasePresenter<DoneView> {
    fileprivate let appEventsNotifier: AppEventsNotifier

    init(appRouter: AppRouter, view: DoneView, appEventsNotifier: AppEventsNotifier) {
        self.appEventsNotifier = appEventsNotifier
        super.init(appRouter: appRouter, view: view)
    }

    deinit {
        print("dealloc \(self)")
    }

    override func setupAfterInit() {
        view?.navigationViewController?.isNavigationBarHidden = true
    }
}

extension DonePresenterImpl: DonePresenter {
    func doneButtonTapped() {
        (view as? UIViewController)?.dismiss(animated: true, completion: { [weak self] in
            self?.appEventsNotifier.dismissQuestionsToMenuEvent.fire()
        })
    }
}
