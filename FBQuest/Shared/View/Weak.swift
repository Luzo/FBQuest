//
//  Weak.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

final class Weak<Item: AnyObject> {
    weak var item: Item?

    init (item: Item) {
        self.item = item
    }
}
