//
//  FramworkGridViewModel.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/25/24.
//

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView  = false
    
}
