//
//  MenuPresenter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

protocol MenuView: View {
    func setWithTopics(topics: [Topic])
}

protocol MenuPresenter: Presenter {
    func topicSelected(atIndex index: Int)
}

final class MenuPresenterImpl: BasePresenter<MenuView> {
    fileprivate var interactor: MenuInteractor?
    fileprivate var topics: [Topic] {
        return interactor?.topics ?? []
    }
    var appEventsNotifier: AppEventsNotifier {
        return appRouter.appScope.resolve(type: AppEventsNotifier.self)
    }
    fileprivate var observers = [Any]()

    override func setupAfterInit() {
        view?.setWithTopics(topics: topics)
    }

    init(interactor: MenuInteractor, appRouter: AppRouter, view: MenuView) {
        self.interactor = interactor
        super.init(appRouter: appRouter, view: view)

        observers = [observeDismissToMenu()]
    }

    fileprivate func observeDismissToMenu() -> Any {
        return appEventsNotifier.dismissToMenuEvent.observe { [weak self] in
            self?.view?.navigationViewController?.popToRootViewController(animated: false)
        }
    }
}

extension MenuPresenterImpl: MenuPresenter {
    func topicSelected(atIndex index: Int) {
        guard let topicId = topics[index].id else {
            assertionFailure("Missing topicID")
            return
        }

        let slidesViewControler = appRouter.appScope.resolve(type: SlidesViewController.self)
        slidesViewControler.presenter?.selectedTopicId = topicId
        view?.navigationViewController?.pushViewController(slidesViewControler, animated: true)
    }
}
