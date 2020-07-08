//
//  ProjectFactory.swift
//  AsanaTests
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation
@testable import Asana

struct ProjectFactory {
    static func build() -> Project {
        return .init(
            gid: faker.word(),
            name: faker.word()
        )
    }
}
