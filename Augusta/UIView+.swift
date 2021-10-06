//
//  UIView+.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import UIKit

extension UIView {
    func edgesEqualToSuperView() {
        guard let superview = superview else {
            assertionFailure("superview is not found.")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: 0),
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 0),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: 0),
        ])
    }
}
