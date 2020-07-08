//
//  RequestType.swift
//  AsanaApi
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation

public protocol RequestType {
    associatedtype Response: Decodable
    var httpMethod: HttpMethod { get }
    var path: String { get }
}

extension RequestType {
    var base: String {
        return "https://app.asana.com/api/1.0"
    }
    var header: [String: String] {
        return [
            "Authorization": "Bearer "
        ]
    }
    var queryItems: [URLQueryItem]? { return nil }
    var body: Data? { return nil }
}
