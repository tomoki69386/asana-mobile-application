//
//  MockApiService.swift
//  AsanaTests
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation
import Combine
import AsanaApi

struct MockResponseData {
    let url: String
    let data: Decodable
}

public final class MockApiService: ApiServiceType {
    
    private var responses: [MockResponseData] = []
    
    public func addResponse<Request: RequestType>(from request: Request, data: Request.Response) {
        self.responses.append(.init(url: request.path, data: data))
    }
    
    public func response<Request: RequestType>(from request: Request) -> AnyPublisher<Request.Response, ApiServiceError> {
        return Future<Request.Response, ApiServiceError> { promise in
            guard let responseData = self.responses.filter({ $0.url == request.path }).first else {
                promise(.failure(.responseError))
                return
            }
            guard let data = responseData.data as? Request.Response else {
                promise(.failure(.parseError(NSError())))
                return
            }
            promise(.success(data))
        }
        .eraseToAnyPublisher()
    }
}


