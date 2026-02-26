//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 2/25/26.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try againg"
    case ivalidData = "Data recieved from the server is invalid. Please try again"
}
