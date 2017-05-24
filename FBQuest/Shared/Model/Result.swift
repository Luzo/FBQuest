//
//  Result.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

enum Result<Response> {
    case success(response: Response)
    case failure(error: Error)

    var response: Response? {
        guard case .success(let response) = self else { return nil }
        return response
    }

    var error: Error? {
        guard case .failure(let error) = self else { return nil }
        return error
    }
}
