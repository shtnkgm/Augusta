//
//   LabelView.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import SwiftUI

struct LabelView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(text.count > 1 ? .leading : .center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: text.count > 1 ? .leading : .center)
            .padding()
            .background(Color.white)
            .frame(minHeight: 44)
            .cornerRadius(16)
    }
}

