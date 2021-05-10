//
//  ContentView.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: NewsViewModelImpl
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.articleCells) {articleCell in
                    articleCell
                }
            }
            .navigationBarTitle(Text("Space News"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: {
            let viewModel = NewsApp().viewModel
            viewModel.articleCells = exampleArticleCells
            viewModel.articleCells.append(ArticleCell(id: exampleArticles.count, article: exampleArticles[0]))
            return viewModel
        }())
    }
}
