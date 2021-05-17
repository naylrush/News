//
//  RefreshScrollView.swift
//  News
//
//  Created by Alexey Davletshin on 16.05.2021.
//

import SwiftUI

struct Refresh {
    var startOffset: CGFloat = 0
    var offset: CGFloat = 0
    var started: Bool
    var released: Bool
    var invalid: Bool = false
}

struct RefreshScrollView<Content: View>: View {
    let tintColor: Color
    var content: Content
    @State var refresh = Refresh(started: false, released: false)
    var onUpdate: () -> ()
    
    init(tintColor: Color, @ViewBuilder content: () -> Content, onUpdate: @escaping () -> ())  {
        self.tintColor = tintColor
        self.content = content()
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        ScrollView {
            GeometryReader { reader -> AnyView in
                DispatchQueue.main.async {
                    if refresh.startOffset == 0 {
                        refresh.startOffset = reader.frame(in: .global).minY
                    }
                    refresh.offset = reader.frame(in: .global).minY
                    
                    if refresh.offset - refresh.startOffset > 80 && !refresh.started {
                        refresh.started = true
                    }
                    
                    if refresh.startOffset == refresh.offset && refresh.started {
                        if !refresh.released {
                            withAnimation(Animation.linear) { refresh.released = true }
                            updateData()
                        } else if refresh.invalid {
                            refresh.invalid = false
                            updateData()
                        }
                    }
                }
                
                return AnyView(Color.black.frame(width: 0, height: 0))
            }
            .frame(width: 0, height: 0)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                if refresh.started && refresh.released {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
                        .offset(y: -32)
                } else {
                    Image(systemName: "arrow.down")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundColor(tintColor)
                        .rotationEffect(.init(degrees: refresh.started ? 180 : 0))
                        .offset(y: -30)
                        .animation(.easeIn)
                        .opacity(refresh.offset != refresh.startOffset ? 1 : 0)
                }
                VStack {
                    content
                }
            }
            .offset(y: refresh.released ? 40 : -10)
        }
    }
    
    func updateData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear) {
                if refresh.startOffset == refresh.offset {
                    onUpdate()
                    refresh.released = false
                    refresh.started = false
                } else {
                    refresh.invalid = true
                }
            }
        }
    }
}
