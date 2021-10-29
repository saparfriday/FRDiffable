//
//  File.swift
//  
//
//  Created by user on 29.10.2021.
//

import UIKit

public struct SupplementaryItem {
    var isHidden: Bool
    var height: CGFloat
    
    public init(isHidden: Bool = true, height: CGFloat = 70.0) {
        self.isHidden = isHidden
        self.height = height
    }
}
