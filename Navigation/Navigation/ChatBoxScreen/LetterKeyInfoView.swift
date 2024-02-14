//
//  LetterKeyInfoView.swift
//  Navigation
//
//  Created by Pin Lu on 2/12/24.
//

import SwiftUI

struct LetterKeyInfoView: View {
    
    @Binding var letter: Letter?
    
    @State var newTitle: String = ""
    @State var notes: String = ""
    @State var selectedPriority: Priority = .High
    
    var body: some View {
        VStack {
            List {
                
                HStack {
                    Text("Title")
                        .font(.title)
                    
                    TextField("", text: $newTitle)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                    
                }
                
                HStack {
                    Text("Priority")
                        .font(.title)
                    
                    Picker("Priority", selection: $selectedPriority) {
                        ForEach(Priority.allCases, id: \.self) { priority in
                            Text(priority.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                
                VStack(alignment: .leading) {
                    Text("Note")
                        .font(.title)
                    
                    TextField("", text: $notes)
                        .frame(width: .infinity)
                        .padding()
                        .background(Color.white)
                        
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                }
                
            }
            .listStyle(.plain)
            .onAppear {
                newTitle = letter?.title ?? ""
                selectedPriority = letter?.priority ?? .High
                notes = letter?.notes ?? ""
            }
            
            
            Spacer()
            
            HStack {
                Button {
                    
                } label: {
                    Text("Cancel")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding()
                        .frame(width: 100)
                        .background(Color.black)
                        .cornerRadius(15)
                }
                
                Button {
                    letter?.title = newTitle
                    letter?.priority = selectedPriority
                    
                } label: {
                    Text("Save")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 100)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
                
            }

            Spacer()
        }
    }
}

struct LetterKeyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        LetterKeyInfoView(letter: .constant(MockData.letter3))
    }
}
