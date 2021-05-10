//
//  ExampleArticles.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

let exampleArticleCells: [ArticleCell] = {
    var exampleArticleCells = [ArticleCell]()
    for (i, article) in exampleArticles.enumerated() {
        var articleCell = ArticleCell(id: i, article: article, image: UIImage(named: "ExampleArticle\(i)"))
        exampleArticleCells.append(articleCell)
    }
    return exampleArticleCells
}()
