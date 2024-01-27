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
                AFButtonLabel(title: "Learn more")
            }

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
