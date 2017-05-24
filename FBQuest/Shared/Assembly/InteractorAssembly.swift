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
        container.register(MenuInteractor.self) { r in
            MenuInteractor(
                topicListResource: TopicListResource(),
                topicListConverter: r.resolve(TopicListConverter.self)!
            )
        }.inObjectScope(.container)

        container.register(TopicListConverter.self) { _ in
            TopicListConverter()
        }.inObjectScope(.container)
    }
}
