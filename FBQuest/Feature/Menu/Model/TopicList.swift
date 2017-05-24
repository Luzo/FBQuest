//
//  MenuItemList.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import ObjectMapper

struct TopicList: Mappable {
    var items: [Topic]?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        items <- map["topics"]
    }
}
