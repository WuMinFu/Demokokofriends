//
//  NetworkManager.swift
//  demokokofriends
//
//  Created by yen fu Chen on 2023/2/15.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func fetchData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "Unexpected response", code: -1, userInfo: nil)))
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Unexpected status code", code: httpResponse.statusCode, userInfo: nil)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
