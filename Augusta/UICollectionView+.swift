//
//  UICollectionView+.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import UIKit

public extension UICollectionView {
    enum SupplementaryViewKind {
        case header
        case footer

        var internalId: String {
            switch self {
            case .header: return UICollectionView.elementKindSectionHeader
            case .footer: return UICollectionView.elementKindSectionFooter
            }
        }
    }

    func registerCell<T: UICollectionViewCell>(type: T.Type) {
        let cellIdentifier = String(describing: type.className)

        if Bundle(for: type.classForCoder()).path(forResource: cellIdentifier, ofType: "nib") != nil {
            let bundle = Bundle(for: T.self)
            let nib = UINib(nibName: type.className, bundle: bundle)
            register(nib, forCellWithReuseIdentifier: type.className)
        } else {
            register(type.self, forCellWithReuseIdentifier: type.className)
        }
    }

    func dequeueCell<T: UICollectionViewCell>(type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as? T else {
            fatalError("non register cell")
        }
        return cell
    }

    func registerHeader<T: UICollectionReusableView>(type: T.Type) {
        registerNibForSupplementaryView(type: type.self, kind: .header)
    }

    func dequeueHeader<T: UICollectionReusableView>(type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueSupplementaryView(type: type, kind: .header, for: indexPath)
    }

    func registerFooter<T: UICollectionReusableView>(type: T.Type) {
        registerNibForSupplementaryView(type: type.self, kind: .footer)
    }

    func dequeueFooter<T: UICollectionReusableView>(type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueSupplementaryView(type: type, kind: .footer, for: indexPath)
    }

    private func registerNibForSupplementaryView<T: UICollectionReusableView>(type: T.Type, kind: SupplementaryViewKind) {
        let identifier = String(describing: type.className)
        if Bundle(for: type.classForCoder()).path(forResource: identifier, ofType: "nib") != nil {
            let bundle = Bundle(for: T.self)
            let nib = UINib(nibName: type.className, bundle: bundle)
            register(nib, forSupplementaryViewOfKind: kind.internalId, withReuseIdentifier: type.className)
        } else {
            register(type.self, forSupplementaryViewOfKind: kind.internalId, withReuseIdentifier: identifier)
        }
    }

    private func dequeueSupplementaryView<T: UICollectionReusableView>(type: T.Type, kind: SupplementaryViewKind, for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind.internalId, withReuseIdentifier: type.className, for: indexPath) as? T else {
            fatalError("non register view")
        }

        return view
    }
}

