//
//  MenuPresenter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

protocol MenuView: View {
    func setWithTitles(titles: [String])
}

protocol MenuPresenter: Presenter {
    func topicSelected(atIndex index: Int)
}

final class MenuPresenterImpl: BasePresenter<MenuView> {
    fileprivate let interactor: MenuInteractor
    fileprivate var topics: [Topic] {
        return interactor.topics
    }

    override func setupAfterInit() {
        view.setWithTitles(titles: topics.map { $0.name ?? "" })
    }

    init(interactor: MenuInteractor, appRouter: AppRouter, view: MenuView) {
        self.interactor = interactor
        super.init(appRouter: appRouter, view: view)
    }
}

extension MenuPresenterImpl: MenuPresenter {
    func topicSelected(atIndex index: Int) {
        print(topics[index])
    }
}
