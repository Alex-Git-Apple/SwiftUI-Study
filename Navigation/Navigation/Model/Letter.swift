//
//  File.swift
//  Navigation
//
//  Created by Pin Lu on 2/3/24.
//

import Foundation
import SwiftUI

enum LetterState {
    case Solved
    case Unsolved
}

struct Letter: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var summary: String
    var notes: String
    var categories: [Category]
    var priority: Priority
    var state: LetterState
    var images: [UIImage]?
    var chatHistory: [Message] = []
}


