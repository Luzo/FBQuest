//
//  AppEventsNotifier.swift
//  FBQuest
//
//  Created by Lubos Lehota on 02/06/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

protocol AppEventsNotifier {
    var dismissToMenuEvent: EventCenter { get }
    var dismissQuestionsToMenuEvent: EventCenter { get }
}

final class AppEventsNotifierImpl: AppEventsNotifier {
    let dismissToMenuEvent = EventCenter()
    let dismissQuestionsToMenuEvent = EventCenter()
}
