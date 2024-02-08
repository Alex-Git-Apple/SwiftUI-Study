//
//  GTPManager.swift
//  Navigation
//
//  Created by Pin Lu on 2/5/24.
//

import Foundation
import SwiftUI
import Combine

protocol GPTManager {
    var newGPTLetterResponse: PassthroughSubject<GPTLetterSummary, Error> { get }
    
    func sendImagesToGPT(images: [UIImage]?) async
    
    func restart()
}

class FakeGPTManager: ObservableObject {
    
    private var subject = PassthroughSubject<GPTLetterSummary, Error>()

    private func getSummary(from: [UIImage]?) async throws -> GPTLetterSummary {
        await withCheckedContinuation({ continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                let response = MockData.gptLetterResponse
                continuation.resume(returning: response)
            }
        })
    }
    
}

extension FakeGPTManager : GPTManager {
    
    var newGPTLetterResponse: PassthroughSubject<GPTLetterSummary, Error> {
        subject
    }
    
    public func sendImagesToGPT(images: [UIImage]?) async {
        do {
            let response = try await getSummary(from: images)
            subject.send(response)
        } catch {
            subject.send(completion: .failure(MMError.GPTNoResponse))
        }
    }
    
    
    
    public func restart() {
        subject = PassthroughSubject<GPTLetterSummary, Error>()
    }
    
}
