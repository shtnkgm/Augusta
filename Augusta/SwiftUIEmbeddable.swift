//
//  SwiftUIEmbeddable.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import SwiftUI
import UIKit

protocol SwiftUIEmbeddable: AnyObject {
    associatedtype Content: View
    
    var host: UIHostingController<Content>? { get set }
    var contentView: UIView { get }
    
    @discardableResult
    func embed(in parent: UIViewController, withView content: Content) -> Self
    
    func removeHost()
}

extension SwiftUIEmbeddable {
    @discardableResult
    func embed(in parent: UIViewController, withView content: Content) -> Self {
        guard let host = host else {
            let host = UIHostingController(rootView: content)
            parent.addChild(host)
            host.didMove(toParent: parent)
            contentView.addSubview(host.view)
            host.view.backgroundColor = .clear
            host.view.edgesEqualToSuperView()
            self.host = host
            return self
        }
        host.rootView = content
        host.view.layoutIfNeeded()
        return self
    }
    
    func removeHost() {
        host?.willMove(toParent: nil)
        host?.view.removeFromSuperview()
        host?.removeFromParent()
        host = nil
    }
}

