//
//  HomeViewViewModel.swift
//  Navigation
//
//  Created by Pin Lu on 2/3/24.
//

import Combine
import Foundation
import SwiftUI

//@MainActor How to solve this?
class HomeViewModel: ObservableObject {
    
    @Published var solvedLetters: [Letter]
    @Published var unsolvedLetters: [Letter]
    @Published var tagSelection: NavigationTag?
    @Published var imagesOfNewLetter: [UIImage]?
    @Published var isWaitingForGPTResponse = false
    
    private var cancellables = Set<AnyCancellable>()
    
    // How to arrange ImportPhotoViewModel?? Is this the best practice ?
    var importedPhotoViewModel: ImportPhotoViewModel
    
    var newLetter: Letter?
    
    private var gptManager: GPTManager
    
    init(gptManager: GPTManager) {
        solvedLetters = []
        unsolvedLetters = []
        self.gptManager = gptManager
        importedPhotoViewModel = ImportPhotoViewModel(gptManager: gptManager)
        subcribeToGPTManager()
    }
    
    func subcribeToGPTManager() {
        gptManager.newGPTLetterResponse
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    // Never happen
                    print("Finished")
                case .failure:
                    self.gptManager.restart()
                    self.subcribeToGPTManager()
                }
            } receiveValue: { [weak self] summary in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.newLetter = Letter(summary: summary)
                    self.isWaitingForGPTResponse = false
                    self.tagSelection = .ChatBot
                }
            }
            .store(in: &cancellables)
    }
}

extension Letter {
    init(summary: GPTLetterSummary) {
        self.init(title: summary.title,
                  summary: summary.summary,
                  notes: "",
                  categories: summary.categories,
                  priority: summary.priority,
                  state: .Unsolved)
    }
}

