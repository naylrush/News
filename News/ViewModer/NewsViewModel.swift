//
//  NewsViewModel.swift
//  News
//
//  Created by Alexey Davletshin on 08.05.2021.
//

import SwiftUI

protocol NewsViewModel: ObservableObject {
    var articleCells: [ArticleCell] { get }
    func updateArticles()
    init(requestBuilder: ArticlesRequestBuilder,
         articleLoader: ArticleLoader,
         imageLoader: ImageLoader)
}

class NewsViewModelImpl: NewsViewModel, ObservableObject {
    let requestBuilder: ArticlesRequestBuilder
    let articleLoader: ArticleLoader
    let imageLoader: ImageLoader
    
    @Published var articleCells: [ArticleCell] = []
    
    func updateArticles() {
        if let request = self.requestBuilder.buildRequest(limit: 20, startIndex: nil) {
            self.articleLoader.loadArticles(from: request) { (articles: [Article]) in
                var articleCells = [ArticleCell]()
                
                for (id, article) in articles.enumerated() {
                    var articleCell = ArticleCell(id: id, article: article)
                    
                    self.imageLoader.loadImage(from: article.imageUrl) { image in
                        articleCell.image = image
                        self.articleCells[id] = articleCell
                    }
                    articleCells.append(articleCell)
                }
                self.articleCells = articleCells
            }
        }
    }
    
    required init(requestBuilder: ArticlesRequestBuilder,
                  articleLoader: ArticleLoader,
                  imageLoader: ImageLoader) {
        self.requestBuilder = requestBuilder
        self.articleLoader = articleLoader
        self.imageLoader = imageLoader
    }
}
