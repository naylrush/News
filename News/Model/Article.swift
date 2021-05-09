//
//  Article.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

struct Article: Identifiable {
    let id: Int
    let articleId: String
    let title: String
    let url: URL
    var image: UIImage? = nil
    let summary: String
    let publishedAt: Date
    let updatedAt: Date
    
    init(id: Int, json: ArticleJson) {
        self.id = id
        self.articleId = json.id
        self.title = json.title
        self.url = json.url
        self.summary = json.summary
        self.publishedAt = json.publishedAt
        self.updatedAt = json.updatedAt
    }
}
