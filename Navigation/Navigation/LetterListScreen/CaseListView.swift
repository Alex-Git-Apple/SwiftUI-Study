//
//  CaseListView.swift
//  Navigation
//
//  Created by Pin Lu on 2/3/24.
//

import SwiftUI

struct CaseListView: View {
    @Binding var letters: [Letter]
    var title: String
    
    var body: some View {
        VStack(spacing: 10) {
            List($letters) { $letter in
                NavigationLink {
                    CaseDetailView(letter: $letter)
                } label: {
                    CaseCell(title: letter.title, summary: letter.summary)
                }
                .padding()
                .background(.orange)
                .shadow(radius: 10)
            }
        }
        .padding(.top)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.large)
        .listStyle(.plain)
    }
}

struct CaseCell: View {
    var title: String
    var summary: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .bold()
                .font(.title2)
            Text(summary)
                .font(.body)
        }
    }
}

struct CaseListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CaseListView(letters: .constant(MockData.homeViewModel.unsolvedLetters), title: "Solved")
        }
    }
}
