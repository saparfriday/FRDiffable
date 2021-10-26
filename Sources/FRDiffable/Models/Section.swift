//
//  Section.swift
//  
//
//  Created by user on 26.10.2021.
//

import UIKit

@available(iOS 13.0, *)
class Section: Hashable {
    let id: String
    var isEmpty: Bool = true
    
    var isShowButton: Bool = true
    var isShowBadge: Bool = false

    init(id: String) {
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

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Section, rhs: Section) -> Bool {
        return lhs.id == rhs.id
    }
    
}
