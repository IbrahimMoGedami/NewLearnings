//
//  ValidationFactory.swift
//  NewLearnings
//
//  Created by Ibrahim Gedami on 03/05/2025.
//

import Foundation

public enum ValidationFactory {
    
    public static var email: TextFieldValidator {
        CompositeValidator([
            (NonEmptyValidator(), "Email is required."),
            (EmailValidator(), "Please enter a valid email.")
        ])
    }
    
    public static var phone: TextFieldValidator {
        CompositeValidator([
            (NonEmptyValidator(), "Phone is required."),
            (NumericValidator(), "Only numbers allowed.")
        ])
    }
    
    public static var name: TextFieldValidator {
        CompositeValidator([
            (NonEmptyValidator(), "Name is required."),
            (NameValidator(), "Name must be at least 2 characters.")
        ])
    }
    
}
