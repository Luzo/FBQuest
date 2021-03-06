//
//  PresenterAssembly.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import Swinject

class PresenterAssembly: Assembly {

    func assemble(container: Container) {

        container.register(AppEventsNotifier.self) { _ in
            AppEventsNotifierImpl()
        }.inObjectScope(.container)

        container.register(MenuPresenter.self) { r in
            MenuPresenterImpl(
                interactor: r.resolve(MenuInteractor.self)!,
                appRouter: AppRouter.instance,
                view: r.resolve(MenuViewController.self)!
            )
        }

        container.register(SlidesPresenter.self) { r in
            SlidesPresenterImpl(
                interactor: r.resolve(SlidesInteractor.self)!,
                appRouter: AppRouter.instance,
                view: r.resolve(SlidesViewController.self)!
            )
        }

        container.register(QuestionsPresenter.self) { r in
            QuestionsPresenterImpl(
                interactor: r.resolve(QuestionsInteractor.self)!,
                appRouter: AppRouter.instance,
                view: r.resolve(QuestionsViewController.self)!,
                answersFormatter: r.resolve(AnswersFormatter.self)!
            )
        }

        container.register(AnswersFormatter.self) { _ in
            AnswersFormatter()
        }

        container.register(DonePresenter.self) { r in
            DonePresenterImpl(
                appRouter: AppRouter.instance,
                view: r.resolve(DoneViewController.self)!,
                appEventsNotifier: r.resolve(AppEventsNotifier.self)!
            )
        }
    }
}
