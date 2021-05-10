//
//  ExampleArticles.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import Foundation

let exampleArticles = [
    Article(
        id: "6097fae1c2ea06001d94fa33",
        title: "SpaceX sets booster reuse milestone on Starlink launch",
        url: URL(string: "https://spacenews.com/spacex-sets-booster-reuse-milestone-on-starlink-launch/")!,
        imageUrl: URL(string: "https://spacenews.com/wp-content/uploads/2021/05/f9-starlink-210509.jpg")!,
        summary: "SpaceX launched a set of Starlink satellites May 9 on a Falcon 9 whose first stage was making its tenth flight, a long-awaited goal in the company’s reusability efforts.",
        publishedAt: DateFormatter.iso8601Full.date(from: "2021-05-09T15:08:17.000Z")!,
        updatedAt: DateFormatter.iso8601Full.date(from: "2021-05-09T15:08:17.000Z")!
    ),
    Article(
        id: "609764e5c2ea06001d94fa30",
        title: "Long March 5B falls into Indian Ocean after world follows rocket reentry",
        url: URL(string: "https://spacenews.com/long-march-5b-falls-into-indian-ocean-after-world-follows-rocket-reentry/")!,
        imageUrl: URL(string: "https://spacenews.com/wp-content/uploads/2021/05/CZ5-launch-april2021-CALT.jpg")!,
        summary: "Debris from a large Chinese rocket stage fell into the Indian Ocean late May 8 Eastern as people around the world watched for signs of the fiery reentry event in the skies.",
        publishedAt: DateFormatter.iso8601Full.date(from: "2021-05-09T04:28:21.000Z")!,
        updatedAt: DateFormatter.iso8601Full.date(from: "2021-05-09T05:52:45.000Z")!
    )
]
