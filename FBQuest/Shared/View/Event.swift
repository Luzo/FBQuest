//
//  Event.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

protocol Event {
    func observe(_ block: @escaping () -> Void) -> Observer<String>
    func removeObserver(_ observer: Observer<String>)
}

public protocol FireableEvent {
    func fire()
}
