//
//  FrameworkListViewCell.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/26/24.
//

import SwiftUI

struct FrameworkListViewCell: View {
    var framework: Framework
    
    var body: some View {
  
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 70, height: 70)


            Text(framework.name)
                .font(.title)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .padding()
            
            Spacer()
        }
    }
}

struct FrameworkListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListViewCell(framework: MockData.sampleFramework)
    }
}
