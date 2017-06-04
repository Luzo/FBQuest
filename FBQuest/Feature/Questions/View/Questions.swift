//
//  Questions.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import ObjectMapper

struct Questions: Mappable {
    var questions: [Question]?
    var topicId: Int?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        questions <- map["questions"]
        topicId <- map["topicId"]
    }
}

