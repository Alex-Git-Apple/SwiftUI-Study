//
//  CaseDetailView.swift
//  Navigation
//
//  Created by Pin Lu on 2/3/24.
//

import SwiftUI

struct CaseDetailView: View {
    @Binding var letter: Letter
    @State var isEditing =  false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Title")
                    .bold()
                    .font(.title2)
                Spacer()
                Text(letter.title)
            }
            
            HStack {
                Text("Priority")
                    .bold()
                    .font(.title2)
                Spacer()
                Text(letter.priority.rawValue)
            }
            
            
            HStack {
                Text("Summary")
                    .bold()
                    .font(.title2)
                Spacer()
                Text(letter.summary)
            }
            
        }
        .padding()
        .background(.pink)
        .padding()
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            LetterEditView(letter: $letter)
        } 
    }
}

struct CaseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CaseDetailView(letter: .constant(MockData.letter2))
        }
    }
}
