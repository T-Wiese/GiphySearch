//
//  SearchBar.swift
//  GiphySearch
//
//  Created by Torin Wiese (Work) on 2/20/23.
//

import SwiftUI

struct SearchBar<T>: View {
    @State var searchTerm = ""
    @StateObject var loader: SearchResultLoader<T>
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchTerm).onSubmit {
                loader.loadResults(searchTerm: searchTerm)
            }
        }.background(
            RoundedRectangle(cornerRadius: 8).foregroundColor(Color(.secondarySystemBackground))
        )
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(loader:GifLoader())
    }
}
