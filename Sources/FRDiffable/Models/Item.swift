//
//  Item.swift
//  
//
//  Created by user on 26.10.2021.
//

import Foundation

enum Item: Hashable {
    case loading(UUID)
    
    static var loadingItems: [Item] {
        Array(repeatingExpression: Item.loading(UUID()), count: 30)
    }
    
    static var loadingItem: [Item] {
        [Item.loading(UUID())]
    }
}
