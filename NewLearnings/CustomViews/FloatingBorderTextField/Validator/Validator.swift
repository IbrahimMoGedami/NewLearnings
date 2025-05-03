//
//  Validator.swift
//  NewLearnings
//
//  Created by Ibrahim Gedami on 03/05/2025.
//

import Foundation

public protocol TextFieldValidator {
    
    func validate(_ text: String, message: String) -> String?
    
}

public struct NonEmptyValidator: TextFieldValidator {
    
    public init() {}
    
    public func validate(_ text: String, message: String = "This field is required.") -> String? {
        text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? message : nil
    }
    
}

public struct EmailValidator: TextFieldValidator {
    
    public init() {}
    
    public func validate(_ text: String, message: String = "Invalid email address.") -> String? {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: text) ? nil : message
    }
    
}

public struct NumericValidator: TextFieldValidator {
    
    public init() {}
    
    public func validate(_ text: String, message: String = "Only numbers allowed.") -> String? {
        CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: text))
        ? nil : message
    }

}

public struct NameValidator: TextFieldValidator {
    
    public init() {}

    public func validate(_ text: String, message: String = "Name too short.") -> String? {
        text.trimmingCharacters(in: .whitespacesAndNewlines).count >= 2 ? nil : message
    }

}
