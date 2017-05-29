//
//  QuestionsInteractor.swift
//  FBQuest
//
//  Created by Lubos Lehota on 29/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

protocol QuestionsInteractor: AnyObject {
}

final class QuestionsInteractorImpl: BaseInteractor {

    deinit {
        print("Deinited \(self)")
    }

    override init(
    ) {

    }

    fileprivate func requestResource() {

    }
}

extension QuestionsInteractorImpl: QuestionsInteractor {
    
}
