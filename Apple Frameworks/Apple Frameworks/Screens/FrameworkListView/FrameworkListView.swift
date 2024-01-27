//
//  FramworkListView.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/26/24.
//

import SwiftUI

struct FrameworkListView: View {
    @ObservedObject var viewModel: MainViewViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.frameworks) { framework in
                NavigationLink {
                    FrameworkListViewDetailView(framework: framework)
                } label: {
                    FrameworkListViewCell(framework: framework)
                }
                
            }
        }
        .navigationTitle("🍎 Frameworks")
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct FrameworkListView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView(viewModel: MainViewViewModel())
    }
}
