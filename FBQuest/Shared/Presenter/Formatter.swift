//
//  BaseFormatter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 15/07/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

protocol FormatterType {
    associatedtype Model
    associatedtype ViewModel

    func format(model: Model) -> ViewModel
}

class Formatter<Model, ViewModel>: FormatterType {
    func format(model: Model) -> ViewModel {
        fatalError("Format must be overriden")
    }
}
