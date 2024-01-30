//
//  CameraView.swift
//  PhotoApp
//
//  Created by Pin Lu on 1/29/24.
//

import SwiftUI

struct CameraView: View {
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State var image: UIImage?
    var body: some View {
        VStack {
            if let selectedImage{
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
            }
            
            Button("Open camera") {
                self.showCamera.toggle()
            }
            .fullScreenCover(isPresented: self.$showCamera) {
                AccessCameraView(selectedImage: self.$selectedImage)
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
