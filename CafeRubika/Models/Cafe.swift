//
//  Cafe.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import Foundation

// MARK: - Cafe
struct Cafe: Codable {
    let id: String
    let types: [Style]
    let sizes: [Size]
    let extras: [Extra]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case types, sizes, extras
    }
}

// MARK: - Extra
struct Extra: Codable {
    let id, name: String
    let subselections: [Subselection]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, subselections
    }
}

// MARK: - Subselection
struct Subselection: Codable {
    let id, name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}

// MARK: - Size
struct Size: Codable {
    let id, name: String
    let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case v = "__v"
    }
}

// MARK: - Style
struct Style: Codable {
    let id, name: String
    let sizes, extras: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, sizes, extras
    }
}
