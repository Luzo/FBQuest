//
//  BaseNotificationCenter.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

class BaseNotificationCenter<Notification: Hashable> {

    var observers = [Weak<Observer<Notification>>]()

    func registerObserverForNotification(_ name: Notification, block: @escaping () -> Void)
        -> Observer<Notification> {

            let observer = Observer(notificationName: name, block: block)
            observers.append(Weak(item: observer))

            return observer
    }

    func removeRegisteredObserverFromObserversArray(_ observer: Observer<Notification>) {
        observers = observers.filter { o in o.item !== observer }
    }

    func postNotificationRegisteredWithName(_ name: Notification) {
        cleanDisposedObservers()
        sendNotificationsToObserversListenedForRegisteredName(name)
    }

    func cleanDisposedObservers() {
        observers = observers.filter { o in o.item != nil }
    }

    func sendNotificationsToObserversListenedForRegisteredName(_ name: Notification) {
        for o in observers {
            if let item = o.item, item.notification == name {
                item.block()
            }
        }
    }
}
