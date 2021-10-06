//
//  SectionHeaderView.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import SwiftUI

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(title: "abc")
            .previewLayout(.fixed(width: 320, height: 50))
    }
}
