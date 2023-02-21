//
//  GifLoader.swift
//  GiphySearch
//
//  Created by [interview candidate] on 2/16/23.
//

import Foundation

class GifLoader: SearchResultLoader<Gif> {
    let url = "https://api.giphy.com/v1/gifs/search?api_key=229ac3e932794695b695e71a9076f4e5&limit=25&offset=0&rating=G&lang=en&q="
    let scheme = "https"
    let host = "api.giphy.com"
    let path = "/v1/gifs/search"
    let apiKey = "229ac3e932794695b695e71a9076f4e5"
    let limit = "20"
    let rating = "G"
    let lang = "en"
    var loading: Bool = false
    var searchTerm: String = ""
    
    override func loadResults(searchTerm: String){
        if(loading) {
            return
        }
        self.searchTerm = searchTerm
        self.searchResults = []
        
        loadResults()
    }
    
    func loadResultsIfNecessary(id: String?) {
        if(loading) {
            return
        }
        if(id == nil) {
            loadResults()
        }
        guard let index = searchResults.firstIndex(where: {$0.id == id}) else {
            return
        }
        if(index == searchResults.count - 6) {
            loadResults()
        }
    }
    
    func loadResults()  {
        if(loading) {
            return
        }
        loading = true
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "limit", value: limit),
            URLQueryItem(name: "offset", value: (searchResults.count > 0 ? String(searchResults.count) : String(0))),
            URLQueryItem(name: "rating", value: rating),
            URLQueryItem(name: "lang", value: lang),
            URLQueryItem(name: "q", value: searchTerm)
        ]
        guard let url = components.url else {
            print("Error")
            loading = false
            return
        }
        print(url)
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: { [self] (data, response, error) -> Void in
            if (error != nil || data == nil) {
                print(error ?? "Error Loading results")
                loading = false
                return
            }
            if let result = parseResults(data: data!) {
                publishResults(result: result)
                loading = false
            }
        })
        
        dataTask.resume()
    }
    
    func publishResults(result: GifResult) {
        DispatchQueue.main.async {
            self.searchResults.append(contentsOf: result.data)
        }
    }
    
    func parseResults(data: Data) -> GifResult? {
        let decoder = JSONDecoder()
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let results = try decoder.decode(GifResult.self, from:data)
            return results
        } catch {
            print(error)
            return nil
        }
    }
    
}

struct GifResult: Decodable {
    let data: [Gif]
}
