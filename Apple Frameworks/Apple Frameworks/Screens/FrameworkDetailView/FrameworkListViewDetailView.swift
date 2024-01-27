//
//  FrameworkListViewDetailView.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/26/24.
//

import SwiftUI

struct FrameworkListViewDetailView: View {
    var framework: Framework
    @State var isShowingSafariView = false
    
    var body: some View {
        VStack {
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                Label("Learn more", systemImage:"book.fill")
            }
            // iOS 15 new style
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.red)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            
            Spacer()

        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            let url = URL(string:framework.urlString) ?? URL(string: "www.apple.com")!
            SafariView(url: url)
        }
    }
}

struct FrameworkListViewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListViewDetailView(framework: MockData.sampleFramework)
    }
}
