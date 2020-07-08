//
//  UnidirectionalDataFlowType.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType

    func apply(_ input: InputType)
}
