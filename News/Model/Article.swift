//
//  Article.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

struct Article: Identifiable {
    let id: Int
    let realId: String
    let title: String
    let url: URL
    var image: UIImage? = nil
    let summary: String
    let publishedAt: Date
    let updatedAt: Date
    
    init(id: Int, json: ArticleJson) {
        self.id = id
        self.realId = json.id
        self.title = json.title
        self.url = json.url
        self.summary = json.summary
        self.publishedAt = json.publishedAt
        self.updatedAt = json.updatedAt
    }
}

var articleExample: Article = {
    var article = Article(id: 0, json: articleJsonExample)
    article.image = UIImage(systemName: "Arrow")
    
    return article
}()

