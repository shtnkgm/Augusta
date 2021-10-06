//
//  NSObject+.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import Foundation

public extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

