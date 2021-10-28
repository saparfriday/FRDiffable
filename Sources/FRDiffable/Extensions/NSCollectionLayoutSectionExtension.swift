//
//  NSCollectionLayoutSectionExtension.swift
//  
//
//  Created by user on 26.10.2021.
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

@available(iOS 13.0, *)
public extension NSCollectionLayoutSection {
    
    static func listLayout(
        environment: NSCollectionLayoutEnvironment,
        height: NSCollectionLayoutDimension,
        spacing: CGFloat = 0,
        contentInsets: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
        sectionHeader: SupplementaryItem = .init(isHidden: true, height: 70.0),
        sectionFooter: SupplementaryItem = .init(isHidden: false, height: 70.0)
    ) -> NSCollectionLayoutSection {

        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: height.isEstimated ? height : .fractionalHeight(1.0)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: height
            ),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = contentInsets
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(sectionHeader.height)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(sectionFooter.height)
            ),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        
        var supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem] = []
        
        if !sectionHeader.isHidden {
            supplementaryItems.append(header)
        }
        
        if !sectionFooter.isHidden {
            supplementaryItems.append(footer)
        }
        
        section.boundarySupplementaryItems = supplementaryItems
        
        return section
    }

    static func gridLayout(
        environment: NSCollectionLayoutEnvironment,
        height: NSCollectionLayoutDimension,
        compactItems: Int,
        regularItems: Int,
        spacing: CGFloat = 0,
        contentInsets: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
        sectionHeader: SupplementaryItem = .init(isHidden: true, height: 70.0),
        sectionFooter: SupplementaryItem = .init(isHidden: false, height: 70.0)
    ) -> NSCollectionLayoutSection {
        
        let count: Int = environment.traitCollection.horizontalSizeClass == .compact ? compactItems : regularItems

        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0 / CGFloat(count)),
                heightDimension: height.isEstimated ? height : .fractionalHeight(1.0)
            )
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: height
            ),
            subitem: item,
            count: count
        )
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = contentInsets
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(sectionHeader.height)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(sectionFooter.height)
            ),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        
        var supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem] = []
        
        if !sectionHeader.isHidden {
            supplementaryItems.append(header)
        }
        
        if !sectionFooter.isHidden {
            supplementaryItems.append(footer)
        }
        
        section.boundarySupplementaryItems = supplementaryItems
        
        return section
    }
    
    static func continuousLayout(
        environment: NSCollectionLayoutEnvironment,
        height: NSCollectionLayoutDimension,
        width: NSCollectionLayoutDimension? = nil,
        spacing: CGFloat = 0,
        scrollBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .continuous,
        contentInsets: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
        sectionHeader: SupplementaryItem = .init(isHidden: false, height: 70.0)
    ) -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: height
            )
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: width ?? height,
                heightDimension: height
            ),
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.orthogonalScrollingBehavior = scrollBehavior
        section.contentInsets = contentInsets
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(sectionHeader.height)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        var supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem] = []
        
        if !sectionHeader.isHidden {
            supplementaryItems.append(header)
        }
        
        section.boundarySupplementaryItems = supplementaryItems
        
        return section
    }
    
}
