//
//  FrameworkDetailView.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/25/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                
            } label: {
                AFButtonLabel(title: "Learn more")
            }

        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
     
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework,
                            isShowingDetailView: .constant(false))
    }
}
