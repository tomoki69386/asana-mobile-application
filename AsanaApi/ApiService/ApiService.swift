//
//  ApiService.swift
//  AsanaApi
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation
import Combine

public protocol ApiServiceType {
    func response<Request: RequestType>(from request: Request) -> AnyPublisher<Request.Response, ApiServiceError>
}

public final class ApiService: ApiServiceType {
    public init() { }
    public func response<Request: RequestType>(from request: Request) -> AnyPublisher<Request.Response, ApiServiceError> {
        
        let pathUrl = URL(string: request.base + request.path)!
        
        var urlComponents = URLComponents(url: pathUrl, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.httpBody = request.body
        
        request.header.forEach { (key, value) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { data, _ in data }
            .mapError { _ in ApiServiceError.responseError }
            .decode(type: Request.Response.self, decoder: decoder)
            .mapError(ApiServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
