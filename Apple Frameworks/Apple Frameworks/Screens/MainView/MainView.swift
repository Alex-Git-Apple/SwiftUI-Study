//
//  MainView.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/26/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        NavigationView {
            mainView
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        LayoutButton(isGrid: $viewModel.isShowingGridView)
                    }
                }
        }
    }
    
    @ViewBuilder
    private var mainView: some View {
        if viewModel.isShowingGridView {
            FrameworkGridView(viewModel: viewModel)
        } else {
            FrameworkListView(viewModel: viewModel)
        }
    }
    
}

struct LayoutButton: View {
    @Binding var isGrid: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isGrid.toggle()
            } label: {
                let iamgeName = isGrid ? "list.bullet" : "rectangle.grid.3x2"
                Image(systemName: iamgeName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .colorMultiply(Color(.label))
                    
            }
            .padding(.trailing, 10)

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
