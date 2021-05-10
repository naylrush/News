//
//  Article.swift
//  News
//
//  Created by Alexey Davletshin on 07.05.2021.
//

import Foundation

struct Article: Codable {
    let id: String
    let title: String
    let url: URL
    let imageUrl: URL
    let summary: String
    let publishedAt: Date
    let updatedAt: Date
}
