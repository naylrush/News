//
//  ImageLoader.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import SwiftUI

protocol ImageLoader {
    func loadImage(from url: URL, completion: @escaping ((UIImage) -> Void))
    init(urlDataLoader: URLDataLoader)
}

class ImageLoaderImpl: ImageLoader {
    let urlDataLoader: URLDataLoader
    
    func loadImage(from url: URL, completion: @escaping ((UIImage) -> Void)) {
        urlDataLoader.loadData(from: url) { data in
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                print("Can't decode image")
            }
        }
    }
    
    required init(urlDataLoader: URLDataLoader) {
        self.urlDataLoader = urlDataLoader
    }
}
