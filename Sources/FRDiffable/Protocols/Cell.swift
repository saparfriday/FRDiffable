//
//  File.swift
//  
//
//  Created by user on 26.10.2021.
//

import Foundation

protocol Cell {
    associatedtype Object

    func configure(with model: Object)
    
    func showLoading()
}
