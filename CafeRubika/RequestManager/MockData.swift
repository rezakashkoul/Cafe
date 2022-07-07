//
//  MockData.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import Foundation

class MockData {
    
    static let shared = MockData()
    
    func loadJsonFile(filename fileName: String) -> Cafe {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Cafe.self, from: data)
                print(jsonData)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        let emptyValue = Cafe(id: "", types: [], sizes: [], extras: [])
        return emptyValue
    }
}

