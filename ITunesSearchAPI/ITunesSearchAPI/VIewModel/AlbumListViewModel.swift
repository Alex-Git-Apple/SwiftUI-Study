//
//  AlbumListViewModel.swift
//  ITunesSearchAPI
//
//  Created by Pin Lu on 2/11/24.
//

import Combine
import Foundation

//https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=20&offset=10
//https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=20
//https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=20

enum ITSState: Comparable {
    case normal
    case loading
    case loadedAll
    case error(String)
}

@MainActor
class AlbumListViewModel: ObservableObject {
    
    @Published var searchItem: String = ""
    @Published var albums: [Album] = []
    @Published var state: ITSState = .normal
    
    private var subscriptions = Set<AnyCancellable>()
    
    let limit: Int = 20
    var page: Int = 0
    var offset: Int {
        page * limit
    }
    
    init() {
        $searchItem
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] text in
                guard let self = self else { return }
                self.state = .normal
                Task {
                    self.albums = []
                    await self.fetchAlbums(for: text)
                }
            }
            .store(in: &subscriptions)
    }
    
    func loadData() async {
        await fetchAlbums(for: searchItem)
    }
    
    func fetchAlbums(for searchTerm: String) async {
        
        guard !searchTerm.isEmpty else { return }
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchItem)n&entity=album&limit=\(limit)&offset=\(offset)") else { return }
        guard self.state == .normal else { return }
        do {
            self.state = .loading
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(AlbumResult.self, from: data)
            self.albums.append(contentsOf: result.results)
            
            if result.resultCount == limit {
                self.state = .normal
                page += 1
            } else {
                self.state = .loadedAll
            }
        } catch (let error ){
            print("error: \(error).")
        }
    }
    
}
