//
//  File.swift
//  
//
//  Created by user on 26.10.2021.
//

import Foundation

public extension Array {
    
    init(repeatingExpression expression: @autoclosure (() -> Element), count: Int) {
        var temp = [Element]()
        for _ in 0..<count {
            temp.append(expression())
        }
        self = temp
    }

}
