//
//  AFButton.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/25/24.
//

import SwiftUI

struct AFButtonLabel: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
    
}

struct AFButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        AFButtonLabel(title: "Test Title")
    }
}
