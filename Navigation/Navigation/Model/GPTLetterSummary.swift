//
//  GPTLetterResponse.swift
//  Navigation
//
//  Created by Pin Lu on 2/5/24.
//

import Foundation

struct GPTLetterSummary: Codable {
    var title: String
    var summary: String
    var categories: [Category]
    var priority: Priority
}
