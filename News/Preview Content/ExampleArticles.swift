//
//  ExampleArticles.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

let exampleArticles: [Article] = {
    var exampleArticles = [Article]()
    for (i, exampleArticleJson) in exampleArticlesJson.enumerated() {
        var article = Article(id: i, json: exampleArticleJson)
        article.image = UIImage(named: "ExampleArticle\(i)")
        exampleArticles.append(article)
    }
    return exampleArticles
}()
