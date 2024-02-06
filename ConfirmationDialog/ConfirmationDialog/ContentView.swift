//
//  ContentView.swift
//  ConfirmationDialog
//
//  Created by Pin Lu on 2/3/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct FileDetails: Identifiable {
    var id: String { name }
    let name: String
    let fileType: UTType
}
struct ConfirmFileImport: View {
    @State private var isConfirming = false
    @State private var dialogDetail: FileDetails?
    
    @State private var showingConfirmation = false
    
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Button("Import File") {
                dialogDetail = FileDetails(
                    name: "MyImageFile.png", fileType: .png)
                isConfirming = true
            }
            .confirmationDialog(
                "Are you sure you want to import this file?",
                isPresented: $isConfirming, presenting: dialogDetail
            ) { detail in
                Button {
                    // Handle import action.
                } label: {
                    Text("Import \(detail.name)")
                }
                Button("Cancel", role: .cancel) {
                    dialogDetail = nil
                }
            } message: { detail in
                Text(
                """
                This will add \(detail.name).\(detail.fileType) \
                to your library.
                """)
            }
            
            Spacer()
            
            Button("Show Confirmation Dialog") {
                showingConfirmation = true
            }
            .confirmationDialog("Delete Item", isPresented: $showingConfirmation, titleVisibility: .visible) {
                Button("Delete", role: .destructive) {
                    // Delete action
                    print("Item deleted")
                }
                Button("Add") {
                    print("Add Item")
                }
                Button("Cancel", role: .cancel) {
                    // Cancel action
                    print("Action cancelled")
                }
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmFileImport()
    }
}
