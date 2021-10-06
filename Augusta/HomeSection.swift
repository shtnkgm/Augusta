//
//  HomeSection.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import UIKit

enum HomeSection: Hashable {
    case nested
    case grid(columunCount: Int)
    case mediumBanner
    case list
    
    var title: String? {
        switch self {
        case .grid(let columunCount): return "\(columunCount) grid"
        case .mediumBanner: return "mediumBanner"
        case .nested: return "nested"
        case .list: return "list"
        }
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let sectionVerticalInset: CGFloat = 20
        let itemInset: CGFloat = 16
//        let sectionHeaderItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: "sectionHeader", alignment: .topLeading)
        
        switch self {
        case .nested:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2 / 3),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets.trailing = itemInset
            
            let nestedItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(1 / 2))
            let nestedItem = NSCollectionLayoutItem(layoutSize: nestedItemSize)
            nestedItem.contentInsets.trailing = itemInset
            
            let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
            
            let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: nestedGroupSize, subitem: nestedItem, count: 2)
            nestedGroup.interItemSpacing = .fixed(itemInset)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalWidth(2/3))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, nestedGroup])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = itemInset
            section.contentInsets.bottom = sectionVerticalInset
            // section.boundarySupplementaryItems = [sectionHeaderItem]
            return section
            
        case .grid(let columnCount):
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/CGFloat(columnCount)),
                                                  heightDimension: .fractionalWidth(1/CGFloat(columnCount)))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets.trailing = itemInset
            item.contentInsets.bottom = itemInset
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .estimated(10))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = itemInset
            // section.boundarySupplementaryItems = [sectionHeaderItem]
            return section
            
        case .mediumBanner:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets.trailing = itemInset
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(160),
                                                   heightDimension: .absolute(60))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = itemInset
            section.contentInsets.bottom = sectionVerticalInset
            section.orthogonalScrollingBehavior = .continuous
//            section.boundarySupplementaryItems = [
//                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: "some", alignment: .topLeading)
//            ]
            return section
            
        case .list:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .estimated(44))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets.bottom = 1
            item.contentInsets.trailing = 16
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(20)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = 16
            section.contentInsets.bottom = 20
//            section.boundarySupplementaryItems = [
//                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: "some", alignment: .topLeading)
//            ]
            return section
        }
    }
}

