//
//  ArticleText.swift
//  News
//
//  Created by Alexey Davletshin on 16.05.2021.
//

import SwiftUI

struct ArticleText: View {
    let article: Article
    
    var body: some View {
        VStack {
        Text(article.title)
                .font(.title2)
                .lineLimit(nil)
                .padding(.horizontal)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            Text(article.summary)
                .lineLimit(nil)
                .padding(.horizontal)
        }
    }
    
    init(_ article: Article) {
        self.article = article
    }
}

struct ArticleText_Previews: PreviewProvider {
    static var previews: some View {
        ArticleText(exampleArticles[0])
    }
}
