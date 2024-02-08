//
//  LetterEditView.swift
//  Navigation
//
//  Created by Pin Lu on 2/3/24.
//

import SwiftUI

struct LetterEditView: View {
    @Binding var letter: Letter
    
    @State var newTitle: String = ""
    @State var selectedPriority: Priority = .High
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            Text("Title")
                .font(.title)
            
            TextField("", text: $newTitle)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
                    
            Text("Priority")
                .font(.title)
            
            Picker("Priority", selection: $selectedPriority) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Spacer()
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                
                Button {
                    letter.title = newTitle
                    letter.priority = selectedPriority
                    dismiss()
                } label: {
                    Text("Submit")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }

            }
            
            Spacer()
            
            
        }
        .onAppear {
            newTitle = letter.title
            selectedPriority = letter.priority
        }
    }
}


struct LetterEditView_Previews: PreviewProvider {
    static var previews: some View {
        LetterEditView(letter: .constant(MockData.letter3))
    }
}
