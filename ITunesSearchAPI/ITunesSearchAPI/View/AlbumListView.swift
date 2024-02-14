//
//  AlbumListView.swift
//  ITunesSearchAPI
//
//  Created by Pin Lu on 2/11/24.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        
        
        NavigationView {
            List {
                ForEach(viewModel.albums) { album in
                    Text(album.collectionName)
                }
                
                switch viewModel.state {
                case .normal:
                    Color.clear
                        .task {
                            await viewModel.loadData()
                        }
                case .loading:
                    ProgressView()
                        .progressViewStyle(.circular)
                case .loadedAll:
                    Text("No more!")
                case .error:
                    EmptyView()
                }
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchItem)
           
        }
        
    }
}

extension View {
    func hidden(_ shouldHide: Bool = true) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
