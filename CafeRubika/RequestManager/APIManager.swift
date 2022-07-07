//
//  APIManager.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    func getCafeProductionData(useMockData: Bool, completion: @escaping (Result<Cafe, ApplicationError>)-> Void) {
        //TODO: real URL must put here
        let url = ""
        if useMockData {
            completion(.success(MockData.shared.loadJsonFile(filename: "mockAPI")))
        } else {
            baseRequest(type: Cafe.self, url: url, completion: completion)
        }
    }
    
   private func baseRequest<T: Decodable>(type: T.Type, url: String, completion: @escaping (Result<T, ApplicationError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.general))
                return
            }
            guard let data = data , let _  = response else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let newData = try decoder.decode(T.self, from: data)
                completion(.success(newData))
            } catch {
                completion(.failure(.decode))
            }
        }
    }
}
