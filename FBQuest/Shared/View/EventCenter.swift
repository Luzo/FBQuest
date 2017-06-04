//
//  EventCenter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

class EventCenter: BaseNotificationCenter<String>, Event, FireableEvent {

    func observe(_ block: @escaping () -> Void) -> Observer<String> {
        return registerObserverForNotification("", block: block)
    }

    func removeObserver(_ observer: Observer<String>) {
        removeRegisteredObserverFromObserversArray(observer)
    }

    func fire() {
        postNotificationRegisteredWithName("")
    }
}
