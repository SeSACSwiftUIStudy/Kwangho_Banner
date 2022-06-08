//
//  ViewModel.swift
//  SwiftUI_Study_Banner
//
//  Created by 최광호 on 2022/06/03.
//

import Foundation

struct Model: Identifiable {
    var imageURL: String
    
    let id = UUID().uuidString
}

class ViewModel: ObservableObject {
    @Published var data: [Model] = [
        Model(imageURL: "1"),
        Model(imageURL: "2"),
        Model(imageURL: "3"),
        Model(imageURL: "4")
    ]
    
    @Published var countSeconds = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
}
