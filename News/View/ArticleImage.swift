//
//  ArticleImage.swift
//  News
//
//  Created by Alexey Davletshin on 17.05.2021.
//

import SwiftUI

struct ArticleImage: View {
    let image: UIImage
    
    init(_ image: UIImage) {
        self.image = image
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
    }
}

struct ArticleImage_Previews: PreviewProvider {
    static var previews: some View {
        ArticleImage(UIImage(named: "ExampleArticle1")!)
    }
}
