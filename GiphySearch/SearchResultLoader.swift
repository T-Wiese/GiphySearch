//
//  SearchResultLoader.swift
//  GiphySearch
//
//  Created by Torin Wiese (Work) on 2/20/23.
//

import Foundation
import SwiftUI

class SearchResultLoader<T>: ObservableObject {
    @Published var searchResults: [T] = []

    func loadResults(searchTerm: String) {}
}


