//
//  ContentView.swift
//  Navigation
//
//  Created by Pin Lu on 2/2/24.
//

import SwiftUI

enum NavigationTag: Hashable {
    case SolvedLetters
    case UnSolvedLetters
    case ChatBot
}

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    @State private var searchText: String = ""
    @State private var importPhoto = false
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
            
                VStack {
                    NavigationLink(destination: solvedCaseList,
                                   tag: NavigationTag.SolvedLetters,
                                   selection: $vm.tagSelection) {
                        CaseView(title: "Solved Cases",
                                 letters: $vm.solvedLetters,
                                 width: geometry.size.width * 0.95,
                                 height: geometry.size.width * 0.75,
                                 backgroundColor: .black)
                    }
                    
                    NavigationLink(destination: unSolvedCaseList,
                                   tag: NavigationTag.UnSolvedLetters,
                                   selection: $vm.tagSelection) {
                        CaseView(title: "Unsolved Cases",
                                 letters: $vm.unsolvedLetters,
                                 width: geometry.size.width * 0.95,
                                 height: geometry.size.width * 0.75,
                                 backgroundColor: .red)
                    }
                    
                    NavigationLink(destination: ChatBoxView(),
                                   tag: NavigationTag.ChatBot,
                                   selection: $vm.tagSelection) {
                        EmptyView()
                    }
                    
                    Spacer()
                    
                    Button {
                        importPhoto = true
                    } label: {
                        ImportPhotoButton()
                    }
                }

            }
            .padding()
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "person")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "bell")
                }
            }
            .sheet(isPresented: $importPhoto) {
                // Choose from album or take a picture.
                ImportPhotoView(vm: vm.importedPhotoViewModel,
                                isWaitingForGPTResponse: $vm.isWaitingForGPTResponse)
            }
            .fullScreenCover(isPresented: $vm.isWaitingForGPTResponse, content: {
                ProgressView()
            })
            
        }
    }
    
    @ViewBuilder
    var solvedCaseList: some View {
        CaseListView(letters: $vm.solvedLetters, title: "Solved Letters")
    }
    
    @ViewBuilder
    var unSolvedCaseList: some View {
        CaseListView(letters: $vm.unsolvedLetters, title: "Unsolved Letters")
    }
}

struct CaseView : View {
    var title: String
    @Binding var letters: [Letter]
    var width: CGFloat
    var height: CGFloat
    var backgroundColor: Color
    
    var body: some View {
        
        Rectangle()
            .fill(backgroundColor)
            .frame(width: width, height: height)
            .cornerRadius(15)
            .overlay {
                VStack {
                    Text(String(letters.count))
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                    Text(title)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                }
            }
    }
}

struct ImportPhotoButton: View {
    var body: some View {
        Rectangle()
            .fill(Color(.black))
            .frame(maxWidth: .infinity, maxHeight: 70)
            .cornerRadius(15)
            .overlay {
                CameraView()
            }
    }
}

struct CameraView: View {
    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 50, height: 50)
            .shadow(radius: 10)
            .overlay(
                Image(systemName: "camera.viewfinder")
            )
    }
}

struct EmptyView: View {
    var body: some View {
        HStack {}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(MockData.homeViewModel)
    }
}
