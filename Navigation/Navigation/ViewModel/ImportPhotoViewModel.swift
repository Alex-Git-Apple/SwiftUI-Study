//
//  ImportPhotoViewModel.swift
//  Navigation
//
//  Created by Pin Lu on 2/5/24.
//

import Foundation
import SwiftUI

class ImportPhotoViewModel: ObservableObject {
    
    @Published var images: [UIImage]?
    
    var gptManager: GPTManager
    
    let colums = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    init(images: [UIImage]? = nil, gptManager: GPTManager) {
        self.images = images
        self.gptManager = gptManager
    }
    
    func sendPhotosToGPT() {
        if let images = images {
            Task {
                await gptManager.sendImagesToGPT(images: images)
            }
        }
        
        // Temprory call
        Task {
            await gptManager.sendImagesToGPT(images: images)
        }
    }
    
}
