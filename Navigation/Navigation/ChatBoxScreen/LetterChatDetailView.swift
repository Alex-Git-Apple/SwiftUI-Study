//
//  LetterChatDetailView.swift
//  Navigation
//
//  Created by Pin Lu on 2/12/24.
//

import SwiftUI

struct LetterChatDetailView: View {
    
    @Binding var letter: Letter?
    @State var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ChatBoxView(letter: $letter)
                .tabItem {
                    Text("Chat")
                }
                .tag(0)
            
            LetterKeyInfoView(letter: $letter)
                .tabItem {
                    Text("See")
                }
                .tag(1)
        }
        
        
    }
}

struct LetterChatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LetterChatDetailView(letter: .constant(MockData.newLetter))
    }
}
