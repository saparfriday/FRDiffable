//
//  Section.swift
//  
//
//  Created by user on 26.10.2021.
//

import UIKit

open class Section: Hashable {
    public let id: String
    open var isEmpty: Bool = true
    
    public var titleText: String = ""
    public var subtitleText: String = ""
    public var isShowButton: Bool = true
    public var isShowBadge: Bool = false

    public init(id: String) {
        self.id = id
    }

    open func registerCells(in collection: UICollectionView) {

    }

    open func cell(for item: AnyHashable, at indexPath: IndexPath, in collection: UICollectionView) -> UICollectionViewCell? {
        return nil
    }

    open func didSelect(item: AnyHashable, at index: Int) {
        
    }

    open func supplementaryView(kind: String, for item: AnyHashable?, at indexPath: IndexPath, in collection: UICollectionView) -> UICollectionReusableView? {
        return nil
    }

    open func layout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        return nil
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Section, rhs: Section) -> Bool {
        return lhs.id == rhs.id
    }
    
}
