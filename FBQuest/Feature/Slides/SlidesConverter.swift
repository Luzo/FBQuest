//
//  SlidesConverter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 28/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

class SlidesConverter: Converter {
    func convert(input: TopicSlidesList) -> [Int: [TopicSlide]] {
        guard let items = input.items else {
            return [:]
        }

        return items.reduce([:]) { (dictionary, topicSlides) in
            var mutableDictionary = dictionary

            if let topicId = topicSlides.topicId {
                mutableDictionary[topicId] = topicSlides.slides ?? []
            }

            return mutableDictionary
        }
    }
}
