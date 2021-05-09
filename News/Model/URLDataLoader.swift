//
//  URLDataLoader.swift
//  News
//
//  Created by Alexey Davletshin on 09.05.2021.
//

import Foundation

class URLDataLoader {
    let urlSession: URLSession
    
    func loadData(from url: URL, completion: @escaping ((Data) -> Void)) {
        urlSession.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Client error")
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                print("Server error")
                return
            }
            
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
    
    required init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}
