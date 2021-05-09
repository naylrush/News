//
//  ArticleJson.swift
//  News
//
//  Created by Alexey Davletshin on 07.05.2021.
//

import Foundation

struct ArticleJson: Codable {
    let id: String
    let title: String
    let url: URL
    let imageUrl: URL
    let summary: String
    let publishedAt: Date
    let updatedAt: Date
}

let articleJsonExample = ArticleJson(
    id: "609764e5c2ea06001d94fa30",
    title: "Long March 5B falls into Indian Ocean after world follows rocket reentry",
    url: URL(string: "https://spacenews.com/long-march-5b-falls-into-indian-ocean-after-world-follows-rocket-reentry/")!,
    imageUrl: URL(string: "https://spacenews.com/wp-content/uploads/2021/05/CZ5-launch-april2021-CALT.jpg")!,
    summary: "Debris from a large Chinese rocket stage fell into the Indian Ocean late May 8 Eastern as people around the world watched for signs of the fiery reentry event in the skies.",
    publishedAt: DateFormatter.iso8601Full.date(from: "2021-05-09T04:28:21.000Z")!,
    updatedAt: DateFormatter.iso8601Full.date(from: "2021-05-09T05:52:45.755Z")!
)
