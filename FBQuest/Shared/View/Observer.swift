//
//  Observer.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

final class Observer<Notification: Hashable> {

    let notification: Notification
    let block: () -> Void

    internal init(notificationName: Notification, block: @escaping () -> Void ) {
        self.notification = notificationName
        self.block = block
    }
}
