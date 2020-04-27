//
//  Covid19Api.swift
//  COVID-19
//
//  Created by Brianna Zamora on 4/18/20.
//  Copyright © 2020 Brianna Zamora. All rights reserved.
//

import Foundation

typealias FetcherCompletionHandler<T: Codable> = (T?, FetcherError?) throws -> Void

protocol Fetcher {
    var baseUrl: URL { get }
    var loading: Bool { get set }
    func fetch<T: Codable>(_ endpoint: String, then complete: @escaping FetcherCompletionHandler<T>)
}

extension Fetcher {
    
    func fetch<T: Codable>(_ endpoint: String, then complete: @escaping FetcherCompletionHandler<T>) {
        let requestURL = baseUrl.appendingPathComponent(endpoint)
        let request = URLRequest(url: requestURL, timeoutInterval: Double.infinity)
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let error = error {
                    throw FetcherError.urlSessionError(message: "URLSession data task error for endpoint '\(endpoint)': \(error.localizedDescription)")
                }
                guard let data = data else {
                    throw FetcherError.noData(message: "Could not get data from \(endpoint)")
                }
                let decodedObjects = try JSONDecoder().decode(T.self, from: data)
                try complete(decodedObjects, nil)
            } catch let fetcherError as FetcherError {
                try! complete(nil, fetcherError)
            } catch let error {
                print(T.self)
                fatalError(error.localizedDescription)
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
}

enum FetcherError: Error {
    case invalidURL(message: String)
    case noData(message: String)
    case urlSessionError(message: String)
    case failedToParse(message: String)
    var localizedDescription: String {
        switch self {
        case .invalidURL(let message):
            return message
        case .noData(let message):
            return message
        case .urlSessionError(let message):
            return message
        case .failedToParse(let message):
            return message
        }
    }
}
