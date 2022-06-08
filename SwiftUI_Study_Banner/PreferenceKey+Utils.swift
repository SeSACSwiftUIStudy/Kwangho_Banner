//
//  PreferenceKey+Utils.swift
//  SwiftUI_Study_Banner
//
//  Created by 최광호 on 2022/06/04.
//

import SwiftUI

struct ScrollOffset: PreferenceKey {
    static var defaultValue: CGFloat = 0.0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
