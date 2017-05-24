//
//  MenuItemListConverter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

class TopicListConverter: Converter {
    func convert(input: TopicList) -> [Topic] {
        return input.items ?? []
    }
}

protocol Converter {
    associatedtype Input
    associatedtype Output
    func convert(input: Input) -> Output
}
