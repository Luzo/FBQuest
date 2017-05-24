//
//  Resource.swift
//  FBQuest
//
//  Created by Lubos Lehota on 23/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import Foundation
import ObjectMapper

protocol Resource {
    associatedtype Input
    associatedtype Response

    func makeRequest(input: Input, completion: (Result<Response>) -> Void)
}

class JsonResource<T>: Resource where T: Mappable {
    func makeRequest(input: String, completion: (Result<T>) -> Void) {
        fatalError("Not implemented yet")

    }
    typealias Input = String
}

class StoredJsonResource<T>: JsonResource<T> where T: Mappable {

    override func makeRequest(input: String, completion: (Result<T>) -> Void) {
        guard
            let fileUrl = Bundle.main.url(forResource: input, withExtension: "json"),
            let jsonData = try? Data(contentsOf: fileUrl),
            let jsonDictionary = (try? JSONSerialization.jsonObject(with: jsonData, options: .init(rawValue: 0))) as? [String: Any],
            let mapped = T(JSON: jsonDictionary)
        else {
                fatalError("File not found")
        }

        completion(Result.success(response: mapped))
    }
}
