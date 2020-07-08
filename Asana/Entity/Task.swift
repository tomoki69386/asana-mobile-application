//
//  Task.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation

struct Task: Codable {
    let gid: String
    let name: String
    
    static let stub = Self(gid: "1234", name: "bug task")
}
