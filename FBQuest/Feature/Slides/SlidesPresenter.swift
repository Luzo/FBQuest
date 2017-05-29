//
//  SlidesPresenter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 28/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import UIKit

protocol SlidesView: View {
    func setupView(withTopicSlide topicSlide: TopicSlide)
    func takeScreenShot() -> UIImage?
    func presentShareViewController(forItems items: [AnyObject])
}

protocol SlidesPresenter: Presenter {
    var selectedTopicId: Int { get set }
    func nexSlideButtonSelected()
    func shareButtonSelected()
}

final class SlidesPresenterImpl: BasePresenter<SlidesView> {
    fileprivate var interactor: SlidesInteractor?
    fileprivate var _selectedTopicId: Int = -1
    fileprivate var _selectedIndex: Int = 0

    fileprivate var selectedIndex: Int {
        get {
            return _selectedIndex
        }
        set {
            _selectedIndex = newValue
            setSlide()
        }
    }
    fileprivate var topics: [TopicSlide] = []

    override func setupAfterInit() {
        setTopicSlides()
    }

    init(interactor: SlidesInteractor, appRouter: AppRouter, view: SlidesView) {
        self.interactor = interactor
        super.init(appRouter: appRouter, view: view)
    }

    fileprivate func setTopicSlides() {
        topics = interactor?.mappedSlides[selectedTopicId] ?? []
        setSlide()
    }

    fileprivate func setSlide() {
        if selectedIndex < topics.count {
            view?.setupView(withTopicSlide: topics[selectedIndex])
        }
    }

}

extension SlidesPresenterImpl: SlidesPresenter {
    var selectedTopicId: Int {
        get {
            return _selectedTopicId
        }
        set {
            _selectedTopicId = newValue
            setTopicSlides()
        }
    }

    func nexSlideButtonSelected() {
        selectedIndex += 1
    }

    func shareButtonSelected() {
        guard let image = view?.takeScreenShot() else { return }
        let objectsToShare: [AnyObject] = [image]
        view?.presentShareViewController(forItems: objectsToShare)
    }
}
