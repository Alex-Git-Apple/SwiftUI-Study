//
//  ContentView.swift
//  PhotoApp
//
//  Created by Pin Lu on 1/29/24.
//

import SwiftUI

struct PhotoPickerView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}
