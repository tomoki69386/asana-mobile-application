//
//  ProjectTasksRequest.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation
import AsanaApi

struct ProjectTasksRequest: RequestType {
    typealias Response = ProjectTasksResponse
    
    let projectGid: String
    
    var path: String {
        return "/projects/\(projectGid)/tasks"
    }
    
    var httpMethod: HttpMethod {
        return .get
    }
}

struct ProjectTasksResponse: Codable {
    let data: [Task]
}
