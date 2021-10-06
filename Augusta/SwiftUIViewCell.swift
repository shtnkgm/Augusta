//
//  SwiftUIViewCell.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import SwiftUI
import UIKit

public final class SwiftUICell<Content>: UICollectionViewCell where Content: View {
    var host: UIHostingController<Content>?
        
    deinit {
        removeHost()
    }
}

extension SwiftUICell: SwiftUIEmbeddable {}
