//
//  ArticleImage.swift
//  News
//
//  Created by Alexey Davletshin on 17.05.2021.
//

import SwiftUI

struct ArticleImage: View {
    let image: UIImage
    let useSizeClasses: Bool
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    init(_ image: UIImage, useSizeClasses: Bool = true) {
        self.image = image
        self.useSizeClasses = useSizeClasses
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .padding(.horizontal, useSizeClasses && sizeClass == .regular ? UIScreen.main.bounds.width / 10 : 0)
    }
}

struct ArticleImage_Previews: PreviewProvider {
    static var previews: some View {
        ArticleImage(UIImage(named: "ExampleArticle1")!)
    }
}
