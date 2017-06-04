//
//  QuestionsConverter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

class QuestionsConverter: Converter {
    func convert(input: QuestionsResponse) -> [Int: [Question]] {
        guard let items = input.items else {
            return [:]
        }

        return items.reduce([:]) { (dictionary, questions) in
            var mutableDictionary = dictionary

            if let topicId = questions.topicId {
                mutableDictionary[topicId] = questions.questions ?? []
            }

            return mutableDictionary
        }
    }
}
