//
//  BannerView.swift
//  SwiftUI_Study_Banner
//
//  Created by 최광호 on 2022/06/03.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        Rectangle()
            .cornerRadius(10)
            .padding()
            .foregroundColor(Color(uiColor: .systemBrown))
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
            .previewLayout(.sizeThatFits)
    }
}
