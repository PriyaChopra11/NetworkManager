//
//  FetchItems.swift
//  Practice
//
//  Created by Dewanshu Sharma on 12/7/2022.
//

import Foundation

public extension URLSession {
    func postRequest<T: Decodable>(with request: URLRequest,
                        completion: @escaping (Result<T, Error>) -> Void) {

        let task = self.dataTask(with: request) { data, response, error in

            if let err = error {
                completion(.failure(err))
                return
            }

            if let data = data {
                print(data)
                
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch(let error) {
                    print(error)
                }
                
            }
        }
        task.resume()
      }
}


