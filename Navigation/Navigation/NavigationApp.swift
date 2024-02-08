//
//  NavigationApp.swift
//  Navigation
//
//  Created by Pin Lu on 2/2/24.
//

import SwiftUI

@main
struct NavigationApp: App {
    @StateObject var homeViewModel = HomeViewModel(gptManager: FakeGPTManager())
    
    var body: some Scene {
        
        WindowGroup {
            HomeView()
                .environmentObject(homeViewModel)
        }
    }
}
