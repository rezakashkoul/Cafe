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
var userCoffee = Cafe(id: "",
                        types: [Style(id: "", name: "", sizes: [], extras: [])],
                        sizes: [Size(id: "", name: "", v: 0)],
                        extras: [Extra(id: "", name: "",
                                       subselections: [Subselection(id: "", name: "")])])

enum ApplicationError: Error {
    case general
    case timeout
    case noData
    case decode
    case badURL
}
