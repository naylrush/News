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
        let loader = NewsLoaderImp()
        let requestBuilder = SpaceNewsRequestBuilder()
        self.viewModel = NewsViewModelImpl(loader: loader, requestBuilder: requestBuilder)
        
        print(newsExample)
        
        viewModel.newsWereUpdated = { print($0.news) }
        viewModel.updateNews()
    }
}
