//
//  AlbumListViewModel.swift
//  ITunesSearchAPI
//
//  Created by Pin Lu on 2/11/24.
//

import Combine
import Foundation

//https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=20
//https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=20
//https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=20

@MainActor
class AlbumListViewModel: ObservableObject {
    
    @Published var searchItem: String = ""
    @Published var albums: [Album] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    let limit: Int = 20
    
    init() {
        $searchItem
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                guard let self = self else { return }
                Task {
                    await self.fetchAlbums(for: term)
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchAlbums(for searchTerm: String) async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchItem)n&entity=album&limit=\(limit)") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(AlbumResult.self, from: data)
            self.albums = result.results
        } catch (let error ){
            print("error: \(error).")
        }
    }
    
}
