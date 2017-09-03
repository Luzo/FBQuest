//
//  MenuItem.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import ObjectMapper

struct Topic: Mappable {
    var name: String?
    var id: Int?
    var image: String?
    var tileColor: String?
    var groupID: Int?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        name <- map["name"]
        id <- map["topicId"]
        image <- map["image"]
        tileColor <- map["tileColor"]
        groupID <- map["groupID"]
    }
}

