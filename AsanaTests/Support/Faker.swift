//
//  Faker.swift
//  AsanaTests
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation

let faker = Faker()

class Faker {
    func number() -> Int {
        return Int.random(in: 0...100000)
    }
    func word() -> String {
        let string = "abcdefghijklmnopqrstuvwxyz"
        var values: [String] = []
        
        for _ in 0...Int.random(in: 20...10000) {
            values.append(
                string.components(separatedBy: "")
                    .randomElement() ?? ""
            )
        }
        
        return values.joined()
    }
}
