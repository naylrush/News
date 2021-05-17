//
//  ArticleImageView.swift
//  News
//
//  Created by Alexey Davletshin on 16.05.2021.
//

import SwiftUI

struct ArticleImageView: View {
    let image: UIImage
    
    @Binding var showImage: Bool
    
    var body: some View {
        Button(action: {
            self.showImage.toggle()
        }) {
            ArticleImage(image)
                .animation(.spring())
                .modifier(OrientationPadding(!showImage))
        }
    }
}

struct ArticleImageView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleImageView(image: UIImage(named: "ExampleArticle1")!, showImage: .constant(false))
    }
}
