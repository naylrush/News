//
//  NewsApp.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

@main
struct NewsApp: App {
    @ObservedObject var viewModel: NewsViewModelImpl
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel)
        }
    }
    
    init() {
        let requestBuilder = SpaceArticlesRequestBuilder()
        
        let urlSession = URLSession.shared
        let urlDataLoader = URLDataLoader(urlSession: urlSession)
        
        let articleLoader = ArticleLoaderImpl(urlDataLoader: urlDataLoader)
        let imageLoader = ImageLoaderImpl(urlDataLoader: urlDataLoader)
        
        self.viewModel = NewsViewModelImpl(requestBuilder: requestBuilder,
                                           articleLoader: articleLoader,
                                           imageLoader: imageLoader)
        
        viewModel.updateArticles()
    }
}
