//
//  GlobalVariables.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import Foundation

let nfcValidID = "60ba1ab72e35f2d9c786c610"
let useMockData = true
var coffee: Cafe?
var order = OrderID(coffeStyle: "", coffeeSize: "", coffeeExtra: "", extraSubSelections: [""])

enum ApplicationError: Error {
    case general
    case timeout
    case noData
    case decode
    case badURL
}

