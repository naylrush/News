//
//  ArticleCell.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

struct ArticleCell: View, Identifiable {
    let id: Int
    let article: Article
    var image: UIImage?
    
    var body: some View {
        VStack(alignment: .center) {
            if let image = self.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("Loading...")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
            }
            Text(article.title)
                .lineLimit(nil)
                .padding(.horizontal)
        }
    }
}


struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(id: 1, article: exampleArticles[1], image: UIImage(named: "ExampleArticle1"))
    }
}
