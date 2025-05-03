//
//  Validator.swift
//  NewLearnings
//
//  Created by Ibrahim Gedami on 03/05/2025.
//

import Foundation

public protocol TextFieldValidator {
    
    func validate(_ text: String) -> String?
    
}

public struct NonEmptyValidator: TextFieldValidator {
    
    public init() {}
    
    public func validate(_ text: String) -> String? {
        text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "This field is required." : nil
    }
    
}

public struct EmailValidator: TextFieldValidator {
    
    public init() {}
    
    public func validate(_ text: String) -> String? {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: text) ? nil : "Invalid email address."
    }
    
}

public struct NumericValidator: TextFieldValidator {
    
    public init() {}
    
    public func validate(_ text: String) -> String? {
        CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: text))
        ? nil : "Only numbers allowed."
    }

}

public struct NameValidator: TextFieldValidator {
    
    public init() {}
    
    public func validate(_ text: String) -> String? {
        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "Name is required."
        }
        
        let containsNumbers = text.rangeOfCharacter(from: .decimalDigits) != nil
        if containsNumbers {
            return "Name cannot contain numbers."
        }
        
        if text.trimmingCharacters(in: .whitespacesAndNewlines).count < 2 {
            return "Name must be at least 2 characters."
        }
        
        return nil
    }
}
