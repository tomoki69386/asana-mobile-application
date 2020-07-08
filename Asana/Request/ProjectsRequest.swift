//
//  ProjectsRequest.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation
import AsanaApi

struct ProjectsRequest: RequestType {
    typealias Response = ProjectsResponse
    
    var httpMethod: HttpMethod {
        return .get
    }
    
    var path: String {
        return "/projects"
    }
}

struct ProjectsResponse: Codable {
    let data: [Project]
}
