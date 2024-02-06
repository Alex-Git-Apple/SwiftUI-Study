//
//  GTPManager.swift
//  Navigation
//
//  Created by Pin Lu on 2/5/24.
//

import Foundation
import SwiftUI

protocol GPTManager {
    func getSummary(from: [UIImage]) async throws -> GPTLetterSummary
}

class FakeGPTManager: ObservableObject {
    
    @Published var newGPTLetterResponse : GPTLetterSummary? = nil

    public func sendImagesToGPT(images: [UIImage]) async {
        do {
            newGPTLetterResponse = try await getSummary(from: images)
        } catch (let error ) {
            print("\(error.localizedDescription)")
        }
    }
    
}

extension FakeGPTManager : GPTManager {
    
    func getSummary(from: [UIImage]) async throws -> GPTLetterSummary {
        await withCheckedContinuation({ continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                let response = MockData.gptLetterResponse
                continuation.resume(returning: response)
            }
        })
    }
    
}
