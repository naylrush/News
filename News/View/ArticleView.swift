//
//  ArticleView.swift
//  News
//
//  Created by Alexey Davletshin on 16.05.2021.
//

import SwiftUI

struct ArticleView: View {
    var articleCell: ArticleCell
    
    @State var showImage = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.textBackground.ignoresSafeArea()
            VStack {
                if let image = articleCell.image {
                    ArticleImageView(image: image, showImage: $showImage)
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
            .navigationBarBackButtonHidden(showImage)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(articleCell: exampleArticleCells[1])
    }
}
