//
//  FrameworkDetailView.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/25/24.
//

import SwiftUI

struct FrameworkGridViewDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State var isShowingSafariView = false
    
    var body: some View {
        VStack {
            XDismissButton(isShowing: $isShowingDetailView)
            
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

struct FrameworkDetailView_Previews: PreviewProvider {
     
    static var previews: some View {
        FrameworkGridViewDetailView(framework: MockData.sampleFramework,
                            isShowingDetailView: .constant(false))
    }
}
