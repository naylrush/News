//
//  ArticlesRequestBuilder.swift
//  News
//
//  Created by Alexey Davletshin on 08.05.2021.
//

import Foundation

protocol ArticlesRequestBuilder {
    func buildRequest(limit: Int?, startIndex: Int?) -> URL?
}

class SpaceArticlesRequestBuilder: ArticlesRequestBuilder {
    let urlPath: URLComponents
    
    func buildRequest(limit: Int?, startIndex: Int?) -> URL? {
        var queryItems = [URLQueryItem]()
        
        if let limit = limit {
            queryItems.append(URLQueryItem(name: "_limit", value: "\(limit)"))
        }
        if let startIndex = startIndex {
            queryItems.append(URLQueryItem(name: "_start", value: "\(startIndex)"))
        }
        
        var request = self.urlPath
        request.queryItems = queryItems
        
        return request.url
    }
    
    init() {
        var urlPath = URLComponents()
        urlPath.scheme = "https"
        urlPath.host = "spaceflightnewsapi.net"
        urlPath.path = "/api/v2/articles/"
        
        self.urlPath = urlPath
    }
}
