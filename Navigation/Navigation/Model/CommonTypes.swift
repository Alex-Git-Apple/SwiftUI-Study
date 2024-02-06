//
//  CommonTypes.swift
//  Navigation
//
//  Created by Pin Lu on 2/5/24.
//

import Foundation

enum Priority: String, CaseIterable, Codable {
    case High
    case Normal
    case Low
}

enum Category: String, Codable {
    case Law
    case Finance
    case Payment
    case Promotion
    case Other
}

enum MessageSenderType: String, Codable {
    case User
    case GPT
}

