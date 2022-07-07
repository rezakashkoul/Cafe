//
//  GlobalVariables.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import Foundation

var useMockData = true
var cafeProduction: Cafe?

enum ApplicationError: Error {
    case general
    case timeout
    case noData
    case decode
    case badURL
}
