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
            Text("위에는 페이지만")
            CustomScrollView()
            Text("아래는 자동만")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
