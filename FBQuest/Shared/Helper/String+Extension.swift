//
//  String+Extension.swift
//  FBQuest
//
//  Created by Lubos Lehota on 30/05/2017.
//  Copyright © 2017 LubosLehota. All rights reserved.
//

extension String {
    func advanceCharacter(by offset: UInt32) -> String {

        let scalar = self.unicodeScalars.first
        let advancedScalar = scalar.flatMap { UnicodeScalar( $0.value + offset) }
        return advancedScalar.flatMap {
            String(unicodeScalarLiteral: String(describing: $0))

            } ?? ""
    }
}
