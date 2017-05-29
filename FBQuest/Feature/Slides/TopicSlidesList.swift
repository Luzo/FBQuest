//
//  TopicSlidesList.swift
//  FBQuest
//
//  Created by Lubos Lehota on 28/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import ObjectMapper

struct TopicSlidesList: Mappable {
    var items: [TopicSlides]?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        items <- map["topicSlides"]
    }
}
