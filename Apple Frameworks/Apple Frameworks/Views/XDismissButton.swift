//
//  XDismissButton.swift
//  Apple Frameworks
//
//  Created by Pin Lu on 1/26/24.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isShowing: Bool
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isShowing = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(isShowing: .constant(false))
    }
}
