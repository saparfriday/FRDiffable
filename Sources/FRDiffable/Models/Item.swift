//
//  Item.swift
//  
//
//  Created by user on 26.10.2021.
//

import Foundation

public enum Item: Hashable {
    case loading(UUID)
    
    public static var loadingItems: [Item] {
        Array(repeatingExpression: Item.loading(UUID()), count: 30)
    }
    
    public static var loadingItem: [Item] {
        [Item.loading(UUID())]
    }
}
