//
//  HomeViewViewModel.swift
//  Navigation
//
//  Created by Pin Lu on 2/3/24.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var solvedLetters: [Letter]
    @Published var unsolvedLetters: [Letter]
    @Published var tagSelection: NavigationTag?
    @Published var imagesOfNewLetter: [UIImage]?
    @Published var isWaitingForGPTResponse = false
    
    // How to arrange ImportPhotoViewModel?? Is this the best practice ?
    var importedPhotoViewModel: ImportPhotoViewModel
    
    var newLetter: Letter?
    
    private var gptManager: GPTManager
    
    init(gptManager: GPTManager) {
        solvedLetters = []
        unsolvedLetters = []
        self.gptManager = gptManager
        importedPhotoViewModel = ImportPhotoViewModel(gptManager: gptManager)
    }
    
    // subscribe to gptManager to get GPTLetterSummary
    
}
