//
//  TopicSlide.swift
//  FBQuest
//
//  Created by Lubos Lehota on 28/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import ObjectMapper

struct TopicSlides: Mappable {
    var slides: [TopicSlide]?
    var topicId: Int?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        slides <- map["slides"]
        topicId <- map["topicId"]
    }
}

