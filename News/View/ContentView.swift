//
//  ContentView.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: NewsViewModelImpl
    
    init(_ viewModel: NewsViewModelImpl) {
        self.viewModel = viewModel
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.secondarySystemFill).ignoresSafeArea()
                VStack {
                    Divider()
                    ScrollView {
                        VStack {
                            ForEach(viewModel.articleCells) { articleCell in
                                NavigationLink(destination: ArticleView(articleCell: articleCell)) {
                                    articleCell
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static func getViewModel() -> NewsViewModelImpl {
        let viewModel = NewsApp().viewModel
        viewModel.articleCells = exampleArticleCells
        viewModel.articleCells.append(
            ArticleCell(id: exampleArticles.count, article: exampleArticles[0])
        )
        return viewModel
    }
    
    static var previews: some View {
        ContentView(getViewModel())
    }
}
