//
//  CompositeValidator.swift
//  NewLearnings
//
//  Created by Ibrahim Gedami on 03/05/2025.
//

import Foundation

public struct CompositeValidator: TextFieldValidator {
    
    private let rules: [(TextFieldValidator, String)]
    
    public init(_ rules: [(TextFieldValidator, String)]) {
        self.rules = rules
    }
    
    public func validate(_ text: String, message _: String = "") -> String? {
        for (validator, message) in rules {
            if let error = validator.validate(text, message: message) {
                return error
            }
        }
        return nil
    }
    
}
