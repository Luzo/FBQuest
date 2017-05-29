//
//  TopicSlide.swift
//  FBQuest
//
//  Created by Lubos Lehota on 28/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import ObjectMapper

struct TopicSlide: Mappable {
    var title: String?
    var description: String?
    var image: String?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        image <- map["image"]
    }
}

