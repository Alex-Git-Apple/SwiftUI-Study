//
//  MainViewViewModel.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/26/24.
//

import Foundation
import SwiftUI

final class MainViewViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView  = false
    @Published var isShowingGridView = true
    @Published var frameworks = MockData.frameworks
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
}

