//
//  ArticleView.swift
//  News
//
//  Created by Alexey Davletshin on 16.05.2021.
//

import SwiftUI

struct ArticleView: View {
    var articleCell: ArticleCell
    
    init(_ articleCell: ArticleCell) {
        self.articleCell = articleCell
    }
    
    @State var showImage = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if let image = articleCell.image {
                    VStack {
                        if !showImage {
                            Divider()
                            Spacer()
                        }
                        ArticleImageView(image: image, showImage: $showImage)
                        if !showImage {
                            Spacer()
                        }
                    }
                    .frame(width: showImage ? geometry.size.width : nil,
                           height: showImage ? geometry.size.height : nil)
                } else {
                    Text("Loading...")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                }
                
                if !showImage {
                    ArticleText(articleCell.article)
                    Spacer()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .background((showImage ? Color.black.opacity(0.8) : Color.textBackground)
                            .ignoresSafeArea())
            .animation(.easeIn)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(exampleArticleCells[1])
    }
}
