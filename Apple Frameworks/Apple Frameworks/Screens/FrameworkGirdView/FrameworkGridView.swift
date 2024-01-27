//
//  FrameworkGridView.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/21/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @ObservedObject var viewModel: MainViewViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns) {
                ForEach(MockData.frameworks) { framework in
                    FrameworkTitleView(framework: framework)
                        .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                }
            }
        }
        .navigationTitle("🍎 Frameworks")
        .sheet(isPresented: $viewModel.isShowingDetailView) {
            let framework = viewModel.selectedFramework ?? MockData.sampleFramework
            FrameworkGridViewDetailView(framework: framework,
                                        isShowingDetailView: $viewModel.isShowingDetailView)
        }
    }
}


struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView(viewModel: MainViewViewModel())
    }
}
