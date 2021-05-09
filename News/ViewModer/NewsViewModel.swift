//
//  NewsViewModel.swift
//  News
//
//  Created by Alexey Davletshin on 08.05.2021.
//

import Foundation

protocol NewsViewModel {
    var news: [News] { get }
    var newsWereUpdated: ((NewsViewModel) -> Void)? { get set }
    init(loader: NewsLoader, requestBuilder: NewsRequestBuilder)
    func updateNews()
}

class NewsViewModelImpl: NewsViewModel {
    let loader: NewsLoader
    let requestBuilder: NewsRequestBuilder
    var newsWereUpdated: ((NewsViewModel) -> Void)?
    
    var news: [News] = [] {
        didSet {
            self.newsWereUpdated?(self)
        }
    }
    
    func updateNews() {
        if let request = self.requestBuilder.buildRequest(limit: 5, startIndex: nil) {
            self.loader.loadNews(from: request) { (news: [News]?) in
                if let news = news {
                    self.news = news
                }
            }
        }
    }
    
    required init(loader: NewsLoader, requestBuilder: NewsRequestBuilder) {
        self.loader = loader
        self.requestBuilder = requestBuilder
    }
}
