//
//  ControllerAssembly.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import Swinject

class InteractorAssembly: Assembly {

    func assemble(container: Container) {
        assembleConverters(container: container)
        assembleInteractors(container: container)
    }

    func assembleConverters(container: Container) {
        container.register(TopicListConverter.self) { _ in
            TopicListConverter()
        }.inObjectScope(.container)

        container.register(SlidesConverter.self) { _ in
            SlidesConverter()
        }.inObjectScope(.container)
    }

    func assembleInteractors(container: Container) {
        container.register(MenuInteractor.self) { r in
            MenuInteractor(
                topicListResource: TopicListResource(),
                topicListConverter: r.resolve(TopicListConverter.self)!
            )
        }.inObjectScope(.container)

        container.register(SlidesInteractor.self) { r in
            SlidesInteractorImpl(
                topicSlidesListResource: TopicSlidesListResource(),
                slidesConverter: r.resolve(SlidesConverter.self)!
            )
        }.inObjectScope(.container)
    }
}
