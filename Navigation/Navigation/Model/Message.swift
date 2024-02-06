//
//  Message.swift
//  Navigation
//
//  Created by Pin Lu on 2/5/24.
//

import Foundation

struct Message: Codable, Hashable {
    var id = UUID()
    let senderType: MessageSenderType
    let content: String
    let date: Date
}
