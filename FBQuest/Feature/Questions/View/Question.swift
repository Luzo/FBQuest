//
//  Question.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

enum QuestionType: String {
    case multiple
    case simple
}

import ObjectMapper

struct Question: Mappable {
    var title: String?
    var subtitle: String?
    var type: QuestionType?
    var answers: [Answer]?
    var correctAnswers: [Int]?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        title <- map["title"]
        subtitle <- map["subtitle"]
        type <- map["type"]
        answers <- map["answers"]
        correctAnswers <- map["correctAnswers"]
    }
}

