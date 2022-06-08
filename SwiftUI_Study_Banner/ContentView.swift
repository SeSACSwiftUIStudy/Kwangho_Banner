//
//  ContentView.swift
//  SwiftUI_Study_Banner
//
//  Created by 최광호 on 2022/05/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CustomScrollView()
            ForEach(1...5, id: \.self) {
                Text("\($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
