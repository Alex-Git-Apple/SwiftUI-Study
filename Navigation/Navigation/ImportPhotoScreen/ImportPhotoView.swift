//
//  ImportPhotoScreen.swift
//  Navigation
//
//  Created by Pin Lu on 2/3/24.
//

import SwiftUI

struct ImportPhotoView: View {
    
    @ObservedObject var vm: ImportPhotoViewModel
    @Binding var isWaitingForGPTResponse: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    // Display purpose only
    private let dataHolder = Array(1..<7)
    
    var body: some View {
        VStack {
            
            Text("Images from Camera or photo Picker.")
                .fontWeight(.semibold)
                .font(.callout)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.vertical)
                .padding(.vertical)
                .padding(.vertical)
            
            LazyVGrid(columns: vm.colums, spacing: 10) {
                ForEach(dataHolder, id: \.self) { image in
                    Image(systemName: "text.below.photo")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 100, height: 100)
                        
                }
            }
            
            
            
            Spacer()
            
            HStack {
                Button {
                    vm.images = nil
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
                    isWaitingForGPTResponse = true
                    vm.sendPhotosToGPT()
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
        }
    }
}

struct ImportPhotoScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ImportPhotoView(vm: MockData.importPhotoViewModel, isWaitingForGPTResponse: .constant(false))
    }
}
