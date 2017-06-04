//
//  QuestionsInteractor.swift
//  FBQuest
//
//  Created by Lubos Lehota on 29/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

protocol QuestionsInteractor: AnyObject {
    var mappedQuestions: [Int: [Question]] { get }
}

final class QuestionsInteractorImpl: BaseInteractor {

    fileprivate let questionsResource: QuestionsResource
    fileprivate let questionsConverter: QuestionsConverter
    private (set) var mappedQuestions: [Int: [Question]] = [:]

    init(
        questionsResource: QuestionsResource,
        questionsConverter: QuestionsConverter
    ) {
        self.questionsResource = questionsResource
        self.questionsConverter = questionsConverter
        super.init()

        requestResource()
    }

    fileprivate func requestResource() {
        questionsResource.makeRequest(input: "Questions")  { (result) in
            switch result {
                case .success(let questionsResponse):
                    mappedQuestions = questionsConverter.convert(input: questionsResponse)
                case .failure( _): break
            }
        }
    }
}

extension QuestionsInteractorImpl: QuestionsInteractor {
    
}
