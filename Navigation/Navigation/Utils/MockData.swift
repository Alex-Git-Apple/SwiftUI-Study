//
//  MockData.swift
//  Navigation
//
//  Created by Pin Lu on 2/5/24.
//

import Foundation

struct MockData {
    
    static let letter1 = Letter(title: "Your HOA is due",
                                summary: "Please pay your HOA before 7.15.2024",
                                notes: "",
                                categories: [.Payment, .Finance],
                                priority: .High,
                                state: .Unsolved)
    
    static let letter2 = Letter(title: "Costco Promotion",
                                summary: "Get your discount on TV before 3.20.2024",
                                notes: "",
                                categories: [.Promotion],
                                priority: .Low,
                                state: .Unsolved)
    
    static let letter3 = Letter(title: "Pay Fast Track",
                                summary: "Please pay your Fast Track before 2.21.2024",
                                notes: "",
                                categories: [.Finance, .Payment],
                                priority: .High,
                                state: .Solved)
    
    static let newLetter = Letter(title: "Your car insurance is due for renewal.",
                                summary: "Please ensure it is renewed before April 15, 2024",
                                notes: "",
                                categories: [.Finance, .Payment],
                                priority: .High,
                                state: .Unsolved)
    
    static let gptLetterResponse = GPTLetterSummary(title: "Your car insurance is due for renewal.",
                                                    summary: "Please ensure it is renewed before April 15, 2024",
                                                    categories: [.Finance, .Payment],
                                                    priority: .High)
    
    static let homeViewModel = {
        var vm = HomeViewModel(gptManager: FakeGPTManager())
        vm.solvedLetters = [ MockData.letter3 ]
        vm.unsolvedLetters = [ MockData.letter1, MockData.letter2 ]
        vm.newLetter = MockData.newLetter
        return vm
    }()
    
    static let importPhotoViewModel = {
        var vm = ImportPhotoViewModel(gptManager: FakeGPTManager())
        return vm
    }()
}
