//
//  ApiServiceError.swift
//  AsanaApi
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation

public enum ApiServiceError: Error {
    case responseError
    case parseError(Error)
}
