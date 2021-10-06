//
//  SwiftUIReusableView.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import SwiftUI
import UIKit

public final class SwiftUIReusableView<Content>: UICollectionReusableView where Content: View {
    var host: UIHostingController<Content>?
        
    deinit {
        removeHost()
    }
}

extension SwiftUIReusableView: SwiftUIEmbeddable {
    var contentView: UIView {
        self
    }
}
