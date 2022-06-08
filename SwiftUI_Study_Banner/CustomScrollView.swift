//
//  CustomScrollView.swift
//  SwiftUI_Study_Banner
//
//  Created by 최광호 on 2022/06/03.
//

import SwiftUI

struct CustomScrollView: View {
    @State var pageIndex: Int = 0
    @State var offset: CGFloat = .zero
    @State var isGestureActive: Bool = false

    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        //MARK: 1번째
        GeometryReader { sizeProxy in
            ScrollView(.horizontal) {
                HStack(spacing: .zero) {
                    ForEach(viewModel.data) {_ in
                        BannerView()
                    }.frame(width: sizeProxy.size.width, height: sizeProxy.size.height * 0.8)
                }
            }
        }.onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
        
        //MARK: 2번쨰
        ScrollViewReader { scrollReader in
            GeometryReader { proxy in
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(alignment: .center) {
                        ForEach(viewModel.data) { page in
                            BannerView()
                        }
                    }
                    .background(GeometryReader(content: { stackProxy in
                        Color.red.preference(key: ScrollOffset.self, value: -stackProxy.frame(in: .named("scroll")).origin.x)
                    }))
                }
                .onPreferenceChange(ScrollOffset.self, perform: { value in
                    let screenWidth = UIScreen.main.bounds.width
                    print(value)
                    value > 100 ? print("true",floor(floor(value/screenWidth))) : print("false",floor(screenWidth))
                    switch floor(value/screenWidth) {
                    case 1: scrollReader.scrollTo(0, anchor: .center)
                    case 2: print("2")
                    case 3: print("3")
                    case 4: print("4")
                    default: break
                    }
                }).coordinateSpace(name: "scroll")
                .overlay {
                    GeometryReader { subProxy in
                        Text(" \(viewModel.data.capacity) / \(viewModel.data.count) ")
                            .background(Color(uiColor: .systemGray5))
                            .padding([.bottom, .trailing])
                            .frame(width: UIScreen.main.bounds.width,
                                   height: subProxy.size.height,
                                   alignment: .bottomTrailing)
                            
                    }
                }
            }
        }
        
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CustomScrollView()
            .previewLayout(.sizeThatFits)
    }
}
