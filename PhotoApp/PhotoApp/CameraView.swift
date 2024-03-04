//
//  CameraView.swift
//  PhotoApp
//
//  Created by Pin Lu on 1/29/24.
//

import Combine
import SwiftUI

struct CameraView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            List(vm.images, id:\.self) { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }

            Button("Open camera") {
                vm.takePhoto()
            }
            .fullScreenCover(isPresented: $vm.showCamera) {
                AccessCameraView(selectedImage: $vm.selectedImage)
            }
        }
    }
    
    func setBinding() {
        
    }
}

class ViewModel: ObservableObject {
    @Published var showCamera = false
    @Published var images = [UIImage]()
    @Published var selectedImage: UIImage?
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $selectedImage.sink { image in
            guard let image = image else { return }
            self.images.append(image)
        }
        .store(in: &subscriptions)
    }
    
    func takePhoto() {
        showCamera = true
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
