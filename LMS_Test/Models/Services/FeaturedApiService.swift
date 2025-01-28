//
//  ProfileService.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import Foundation
import Combine

protocol FeaturedApiService {
    func fetchSummery() -> AnyPublisher<FeaturedModel, Error>
    func fetchSquadList() -> AnyPublisher<[SquadListModel], Error>
    
}

class DefaultFeaturedApiService: FeaturedApiService {
    let networkProvider: NetworkProvider

    init(networkProvider: NetworkProvider = URLSession.shared) {
        self.networkProvider = networkProvider
    }
    
    func fetchSummery() -> AnyPublisher<FeaturedModel, Error> {
        let url = URL(string: Constant.URL.baseURL + "/GetWorldTeamProfileSummery?teamId=7027")!
                
        return networkProvider.load(URLRequest(url: url))
            .decode(type: FeaturedModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchSquadList() -> AnyPublisher<[SquadListModel], Error> {
        let url = URL(string: Constant.URL.baseURL + "/GetWorldTeamProfile?typeId=1&teamId=7027")!
                
        return networkProvider.load(URLRequest(url: url))
            .decode(type: [SquadListModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
