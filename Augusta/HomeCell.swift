//
//  HomeCell.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import Foundation

enum HomeCell: Hashable {
    case smallBannerItem(Int)
    case gridItem(Int)
    case nestedItem(Int)
    case listItem(String)
}
