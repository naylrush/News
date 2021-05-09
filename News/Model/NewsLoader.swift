//
//  NewsLoader.swift
//  News
//
//  Created by Alexey Davletshin on 07.05.2021.
//

import Foundation

protocol NewsLoader {
    func loadNews(from url: URL, completion: @escaping (([News]) -> Void))
}

class NewsLoaderImp: NewsLoader {
    private let urlSession = URLSession.shared
    
    func loadNews(from url: URL,
                  completion: @escaping (([News]) -> Void)) {
        urlSession.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                
                let news = try decoder.decode([News].self, from: data)
                completion(news)
            } catch {
                print(error)
            }
        }.resume()
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
