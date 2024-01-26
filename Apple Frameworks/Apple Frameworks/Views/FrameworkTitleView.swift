//
//  FrameworkTitleView.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/26/24.
//

import SwiftUI

struct FrameworkTitleView: View {
    var framework: Framework
    
    var body: some View {
  
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)


            Text(framework.name)
                .font(.title)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
        .padding()
    }
}

struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
    }
}
