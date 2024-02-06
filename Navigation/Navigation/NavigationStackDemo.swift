//
//  NavigationStackDemo.swift
//  Navigation
//
//  Created by Pin Lu on 2/4/24.
//

import SwiftUI

struct NavigationStackDemo: View {
    @State private var presentedNumbers = [1, 4, 8]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $presentedNumbers) {
                List(1..<50) { i in
                    NavigationLink(value: i) {
                        Label("Row \(i)", systemImage: "\(i).circle")
                    }
                }
                .navigationDestination(for: Int.self) { i in
                    Text("Detail \(i)")
                }
                .navigationTitle("Navigation")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct NavigationStackDemo2: View {
    @State private var presentedNumbers = [Int]()

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $presentedNumbers) {
                List(1..<50) { i in
                    NavigationLink(value: i) {
                        Label("Row \(i)", systemImage: "\(i).circle")
                    }
                }
                .navigationDestination(for: Int.self) { i in
                    VStack {
                        Text("Detail \(i)")
                        
                        Button("Go to Next") {
                            presentedNumbers.append(i + 1)
                        }
                    }
                }
                .navigationTitle("Navigation")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct NavigationStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackDemo2()
    }
}
