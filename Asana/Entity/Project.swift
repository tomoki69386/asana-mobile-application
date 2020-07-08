//
//  Project.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation

struct Project: Codable {
    let gid: String
    let name: String
    
    static let stub = Self(gid: "1259420", name: "Product Backlog (app)")
}
