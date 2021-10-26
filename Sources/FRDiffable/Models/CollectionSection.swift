//
//  CollectionSection.swift
//  
//
//  Created by user on 26.10.2021.
//

import UIKit

@available(iOS 13.0, *)
open class CollectionSection<T: Hashable, CollectionCell: Cell>: Section
where CollectionCell: UICollectionViewCell, CollectionCell.Object == T {
    
    // MARK: - new
    public var canLoadMore: Bool = false
    public var modelsCount: Int = 0
    public var headerButtonTapped: (() -> Void)?
    public var loadMore: (() -> Void)?
    // end
    
    open var layout: ((NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection)?
    public var cellConfiguration: ((CollectionCell) -> Void)?
    public var cellSelection: ((T, Int) -> Void)?

    private var cellId: String {
        return String(describing: CollectionCell.self)
    }

    public override func registerCells(in collection: UICollectionView) {
        collection.register(UINib(nibName: cellId, bundle: nil),
                            forCellWithReuseIdentifier: cellId)
    }

    public override func cell(for item: AnyHashable, at indexPath: IndexPath, in collection: UICollectionView) -> UICollectionViewCell? {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CollectionCell else {
            return nil
        }
        cell.sizeToFit()
        if let item = item as? T {
            cell.configure(with: item)
        } else {
            cell.showLoading()
        }
        
        cellConfiguration?(cell)

        return cell
    }

    public override func didSelect(item: AnyHashable, at index: Int) {
        guard let item = item as? T else {
            return
        }

        cellSelection?(item, index)
    }

    public override func layout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        return layout?(environment)
    }
}
