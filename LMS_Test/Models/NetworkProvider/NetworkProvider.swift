//
//  NetworkProvider.swift
//  LMS_Test
//
//  Created by russel on 28/1/25.
//

import Foundation
import Combine

protocol NetworkProvider {
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError>
}

extension URLSession: NetworkProvider {
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return dataTaskPublisher(for: request)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
