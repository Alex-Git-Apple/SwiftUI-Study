//
//  ChatBoxView.swift
//  Navigation
//
//  Created by Pin Lu on 2/6/24.
//

import SwiftUI

struct ChatBoxView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var chatMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Title")
                    .bold()
                    .font(.title2)
                Spacer()
                Text(homeViewModel.newLetter?.title ?? "")
            }
            
            HStack {
                Text("Priority")
                    .bold()
                    .font(.title2)
                Spacer()
                Text(homeViewModel.newLetter?.priority.rawValue ?? "")
            }
            
            
            HStack {
                Text("Summary")
                    .bold()
                    .font(.title2)
                Spacer()
                Text(homeViewModel.newLetter?.summary ?? "")
            }
            
            TextField("Ask me more...", text: $chatMessage)
                .font(.caption)
                .padding()
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.white)
                .padding()
                .shadow(radius: 5)
            
            Spacer()
            
            HStack {
                Button {
                    if let newLetter = homeViewModel.newLetter {
                        homeViewModel.unsolvedLetters.append(newLetter)
                    }
                    homeViewModel.tagSelection = .UnSolvedLetters
                } label: {
                    Text("Save As Unsolved")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                
                Button {
                    if let newLetter = homeViewModel.newLetter {
                        homeViewModel.solvedLetters.append(newLetter)
                    }
                    homeViewModel.tagSelection = .SolvedLetters
                } label: {
                    Text("Save As Solved")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
            }
        }
        .padding()
        .background(.pink)
        .padding()
    }
    
    
}

struct ChatBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBoxView()
            .environmentObject(MockData.homeViewModel)
    }
}
