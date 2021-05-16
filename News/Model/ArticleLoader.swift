//
//  ArticleLoader.swift
//  News
//
//  Created by Alexey Davletshin on 07.05.2021.
//

import Foundation

protocol ArticleLoader {
    func loadArticles(from url: URL, completion: @escaping (([Article]) -> Void))
    init(urlDataLoader: URLDataLoader)
}

class ArticleLoaderImpl: ArticleLoader {
    let urlDataLoader: URLDataLoader
    
    func loadArticles(from url: URL, completion: @escaping (([Article]) -> Void)) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        
        urlDataLoader.loadData(from: url) { [decoder] data in
            do {
                let articlesJson = try decoder.decode([Article].self, from: data)
                
                completion(articlesJson)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
    }
    
    required init(urlDataLoader: URLDataLoader) {
        self.urlDataLoader = urlDataLoader
    }
}

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        return formatter
    }()
}
