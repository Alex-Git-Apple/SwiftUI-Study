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
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchItem)
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
