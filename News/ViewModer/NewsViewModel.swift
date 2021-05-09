//
//  NewsViewModel.swift
//  News
//
//  Created by Alexey Davletshin on 08.05.2021.
//

import Foundation

protocol NewsViewModel {
    var news: [Article] { get }
    var newsWereUpdated: ((NewsViewModel) -> Void)? { get set }
    var imageWasLoaded: ((NewsViewModel, Int) -> Void)? { get set }
    
    init(requestBuilder: ArticlesRequestBuilder,
         articleJsonLoader: ArticleJsonLoader,
         imageLoader: ImageLoader)
    func updateNews()
}

class NewsViewModelImpl: NewsViewModel {
    let requestBuilder: ArticlesRequestBuilder
    let articleJsonLoader: ArticleJsonLoader
    let imageLoader: ImageLoader
    var newsWereUpdated: ((NewsViewModel) -> Void)?
    var imageWasLoaded: ((NewsViewModel, Int) -> Void)?
    
    var news: [Article] = [] {
        didSet {
            self.newsWereUpdated?(self)
        }
    }
    
    func updateNews() {
        if let request = self.requestBuilder.buildRequest(limit: 5, startIndex: nil) {
            self.articleJsonLoader.loadArticles(from: request) { (articlesJson: [ArticleJson]) in
                var articles = [Article]()
                for (id, articleJson) in articlesJson.enumerated() {
                    var article = Article(id: id, json: articleJson)
                    self.imageLoader.loadImage(from: articleJson.imageUrl) { image in
                        article.image = image
                        self.imageWasLoaded?(self, id)
                    }
                    articles.append(article)
                }
                self.news = articles
            }
        }
    }
    
    required init(requestBuilder: ArticlesRequestBuilder,
                  articleJsonLoader: ArticleJsonLoader,
                  imageLoader: ImageLoader) {
        self.requestBuilder = requestBuilder
        self.articleJsonLoader = articleJsonLoader
        self.imageLoader = imageLoader
    }
}
