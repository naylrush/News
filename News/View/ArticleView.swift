//
//  ArticleView.swift
//  News
//
//  Created by Alexey Davletshin on 16.05.2021.
//

import SwiftUI

struct ArticleView: View {
    var articleCell: ArticleCell
    
    var body: some View {
        VStack {
            if let image = articleCell.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("Loading...")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
            }
            Text(articleCell.article.title)
                .font(.title2)
                .lineLimit(nil)
                .padding(.horizontal)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            Text(articleCell.article.summary)
                .lineLimit(nil)
                .padding(.horizontal)
            Spacer()
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(articleCell: ArticleCell(id: 1, article: exampleArticles[1], image: UIImage(named: "ExampleArticle1")))
    }
}
