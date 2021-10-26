//
//  FRDiffable.swift
//  
//
//  Created by user on 26.10.2021.
//

import UIKit

@available(iOS 13.0, *)
public protocol FRDiffableDelegate: AnyObject {
    func sections() -> [Section]
    func allPossibleSections() -> [Section]
    func itemsFor(section: Section) -> [AnyHashable]
}

@available(iOS 13.0, *)
public class FRDiffable: NSObject {
    
    // MARK: - Views
    
    private weak var collection: UICollectionView?
    
    // MARK: - Data
    
    private lazy var datasource: UICollectionViewDiffableDataSource<Section, AnyHashable> = UICollectionViewDiffableDataSource(collectionView: self.collection!, cellProvider: cell)
    
    private weak var delegate: FRDiffableDelegate?
    
    // MARK: - Init

    public init(collection: UICollectionView, delegate: FRDiffableDelegate) {
        self.collection = collection
        self.delegate = delegate
        super.init()
        collection.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: sectionLayout)
        collection.delegate = self
        datasource.supplementaryViewProvider = supplementaryView
        
        for section in delegate.allPossibleSections() {
            section.registerCells(in: collection)
        }
    }
    
    // MARK: - Methods

    private func cell(in collection: UICollectionView, at indexPath: IndexPath, for item: AnyHashable) -> UICollectionViewCell? {
        guard let item = datasource.itemIdentifier(for: indexPath) else {
            return nil
        }
        let section = datasource.snapshot().sectionIdentifiers[indexPath.section]
        return section.cell(for: item, at: indexPath, in: collection)
    }

    private func supplementaryView(in collection: UICollectionView, kind: String, at indexPath: IndexPath) -> UICollectionReusableView? {
        let section = datasource.snapshot().sectionIdentifiers[indexPath.section]
        return section.supplementaryView(kind: kind, for: datasource.itemIdentifier(for: indexPath), at: indexPath, in: collection)
    }

    private func sectionLayout(for sectionIndex: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        let section = datasource.snapshot().sectionIdentifiers[sectionIndex]
        return section.layout(environment: environment)
    }

    public func performUpdates(animated: Bool, completion: (() -> Void)? = nil) {
        guard let delegate = delegate else { return }

        var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        for section in delegate.sections() {
            snapshot.appendSections([section])

            let items = delegate.itemsFor(section: section)
            section.isEmpty = items.count == 0
            snapshot.appendItems(items)
        }
        datasource.apply(snapshot, animatingDifferences: animated, completion: completion)
    }
    
}

// MARK: - Collection Delegate

@available(iOS 13.0, *)
extension FRDiffable: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = datasource.itemIdentifier(for: indexPath) else {
            return
        }
        let section = datasource.snapshot().sectionIdentifiers[indexPath.section]
        section.didSelect(item: item, at: indexPath.row)
    }
    
}
