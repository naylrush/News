//
//  NewsApp.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

@main
struct NewsApp: App {
    var viewModel: NewsViewModel
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        let requestBuilder = SpaceArticlesRequestBuilder()
        
        let urlSession = URLSession.shared
        let urlDataLoader = URLDataLoader(urlSession: urlSession)
        
        let articleJsonLoader = ArticleJsonLoaderImpl(urlDataLoader: urlDataLoader)
        let imageLoader = ImageLoaderImpl(urlDataLoader: urlDataLoader)
        
        self.viewModel = NewsViewModelImpl(requestBuilder: requestBuilder,
                                           articleJsonLoader: articleJsonLoader,
                                           imageLoader: imageLoader)
        
        viewModel.newsWereUpdated = { print($0.news) }
        viewModel.updateNews()
    }
}
