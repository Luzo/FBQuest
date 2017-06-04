//
//  MenuInteractor.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

final class MenuInteractor: BaseInteractor {

    fileprivate let topicListResource: TopicListResource
    fileprivate let topicListConverter: TopicListConverter

    var topics: [Topic] = []

    init(
        topicListResource: TopicListResource,
        topicListConverter: TopicListConverter
    ) {
        self.topicListResource = topicListResource
        self.topicListConverter = topicListConverter
        super.init()
        requestResource()
    }

    func requestResource() {
        topicListResource.makeRequest(input: "Topics") { (result) in
            switch result {
                case .success(let list):
                    topics = topicListConverter.convert(input: list)
                case .failure( _): break
            }
        }
    }
}
