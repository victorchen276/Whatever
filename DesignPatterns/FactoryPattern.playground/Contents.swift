import UIKit
import Foundation
//The factory pattern is a creational pattern that provides a way to make objects without exposing creation logic
//1: the factor creates objects
//2: the products are the objects that are created.

//simple factory, abstract factory, goal: to isolate object creation logic within tis own construct

public struct JobApplicant {
    
    public let name: String
    public let email: String
    public var status: Status
    
    public enum Status {
        case new
        case interview
        case hired
        case rejected
    }
    
}

public struct Email {
    
    public let subject: String
    public let messagesBody: String
    public let recipientEmail: String
    public let senderEmail: String
    
}

public struct EmailFactory {
    
    public let senderEmail: String
    public func createEmail(to recipient: JobApplicant) -> Email {
        let subject: String
        let messageBody: String
        
        switch recipient.status {
        case .new:
            subject = "We received your application"
            messageBody = "Thanks for applyting for a job here!"
        case .interview:
            subject = "We received your application"
            messageBody = "Thanks for applyting for a job here!"
        case .hired:
            subject = "We received your application"
            messageBody = "Thanks for applyting for a job here!"
        case .rejected:
            subject = "We received your application"
            messageBody = "Thanks for applyting for a job here!"
        }
        return Email(subject: subject,
                     messagesBody: messageBody,
                     recipientEmail: recipient.email,
                     senderEmail: senderEmail)
    }
    
}

//if your object requires a series of steps to build, you may be better off using the builder pattern or another pattern instead.
