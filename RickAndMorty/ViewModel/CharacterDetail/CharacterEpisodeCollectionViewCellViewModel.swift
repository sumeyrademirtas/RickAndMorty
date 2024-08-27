//
//  CharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 27.08.2024.
//

import Foundation

protocol EpisodeDataRender {
    var episode: String { get }
    var air_date: String { get }
    var name: String { get }

}

final class CharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    private var isFetching = false
    private var dataBlock: ((EpisodeDataRender) -> Void )?
    
    private var episode: Episode? {
        didSet {
            guard let model = episode else {
               return
            }
            dataBlock?(model)
        }
    }
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
    
    
    // MARK: -Public
    
    public func registerForData(_ block: @escaping (EpisodeDataRender) -> Void) {
        self.dataBlock = block
    }
    
    public func fetchEpisode() {
        guard !isFetching else {
            if let model = episode {
                self.dataBlock?(model)
            }
            return
        }
        guard let url = episodeDataUrl, let request = Request(url: url) else {
            return
        }
        isFetching = true
        
        Service.shared.execute(request, expecting: Episode.self) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model 
                }
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
