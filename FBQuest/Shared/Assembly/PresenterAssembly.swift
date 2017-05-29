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
    }
}
