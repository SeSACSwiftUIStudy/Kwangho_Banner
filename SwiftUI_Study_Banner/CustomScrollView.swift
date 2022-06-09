//
//  CustomScrollView.swift
//  SwiftUI_Study_Banner
//
//  Created by 최광호 on 2022/06/03.
//

import SwiftUI

struct CustomScrollView: View {
    @State var offset: CGFloat = .zero
    @State var isGestureActive: Bool = false
    
    @State var pageIndex = 0
    @StateObject var viewModel = ViewModel()
    @GestureState var isDetecting = false
    
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
                    HStack(spacing: .zero) {
                        ForEach(viewModel.data) { page in
                            BannerView()
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.5, alignment: .leading)
                        .offset(x: CGFloat(self.pageIndex) * -proxy.size.width, y: 0)
                        .animation(.spring())
                        .onReceive(self.viewModel.countSeconds, perform: { _ in
                            self.pageIndex = (self.pageIndex + 1) % self.viewModel.data.count
                        })
                    }
                    .background(GeometryReader(content: { stackProxy in
                        Color.red.preference(key: ScrollOffset.self, value: -stackProxy.frame(in: .named("scroll")).origin.x)
                    }))
                }
                /*
                 .gesture(DragGesture().updating($isDetecting) { current, gesture, transcation in
                 self.viewModel.screenDrag = current.translation.width
                 }.onEnded { value in
                 self.viewModel.screenDrag = 0
                 
                 if (value.translation.width < -50) &&  self.viewModel.activePage < self.viewModel.data.count - 1 {
                 self.viewModel.activePage += 1
                 let impactMed = UIImpactFeedbackGenerator(style: .medium)
                 impactMed.impactOccurred()
                 }
                 
                 if (value.translation.width > 50) && self.viewModel.activePage > 0 {
                 self.viewModel.activePage -= 1
                 let impactMed = UIImpactFeedbackGenerator(style: .medium)
                 impactMed.impactOccurred()
                 }
                 })
                 
                 .onPreferenceChange(ScrollOffset.self, perform: { value in
                 print(value)
                 }).coordinateSpace(name: "scroll")
                 */
                .overlay {
                    GeometryReader { subProxy in
                        Text(" \(self.pageIndex + 1) / \(viewModel.data.count) ")
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
