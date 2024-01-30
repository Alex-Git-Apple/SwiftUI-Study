//
//  ContentView.swift
//  PhotoApp
//
//  Created by Pin Lu on 1/29/24.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    
    @State private var selectedItem: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []
    
    var body: some View {
        
        VStack {
            PhotosPicker("Select an image",
                         selection: $selectedItem,
                         matching: .images)
            .onChange(of: selectedItem) { selectedItems in
                images = []
                for item in selectedItems {
                    item.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let imageData):
                            if let imageData {
                                self.images.append(UIImage(data: imageData)!)
                            } else {
                                print("No supported content type found.")
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            }
    
            ScrollView {
                ForEach(images, id:\.cgImage){ image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }
            }
        }
        .padding()
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}
