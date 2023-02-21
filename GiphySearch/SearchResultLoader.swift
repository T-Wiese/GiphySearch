//
//  SearchResultLoader.swift
//  GiphySearch
//
//  Created by [interview candidate] on 2/20/23.
//

import Foundation
import SwiftUI

class SearchResultLoader<T>: ObservableObject {
    @Published var searchResults: [T] = []

    func loadResults(searchTerm: String) {}
}


