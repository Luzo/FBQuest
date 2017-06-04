//
//  Answer.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import ObjectMapper

struct Answer: Mappable {
    var optionId: Int?
    var option: String?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        optionId <- map["optionID"]
        option <- map["option"]
    }
}
