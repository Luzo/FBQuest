//
//  QuestionsList.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import ObjectMapper

struct QuestionsResponse: Mappable {
    var items: [Questions]?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        items <- map["questions"]
    }
}
