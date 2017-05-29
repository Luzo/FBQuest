//
//  Converter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 28/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

protocol Converter {
    associatedtype Input
    associatedtype Output
    func convert(input: Input) -> Output
}
