//
//  GifList.swift
//  GiphySearch
//
//  Created by [interview candidate] on 2/16/23.
//

import SwiftUI

struct GifList: View {
    @ObservedObject var loader: GifLoader
    var body: some View {
        if(loader.searchResults.isEmpty) {
            VStack(alignment:.center) {
                Spacer()
                Text("No Results")
                Spacer()
            }
        } else {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    HStack(alignment:.top, spacing:0) {
                        LazyVStack(spacing:0) {
                            ForEach(Array(loader.searchResults.enumerated()), id:\.element) { index, element in
                                if(index % 2 == 0) {
                                    ShareLink(item: element.images.fixedWidth.url ?? "") {
                                        GifView(gif: element).frame(height:250).onAppear {
                                            loader.loadResultsIfNecessary(id: element.id)
                                        }
                                    }
                                }
                            }
                        }
                        LazyVStack(spacing:0) {
                            ForEach(Array(loader.searchResults.enumerated()), id:\.element) { index, element in
                                if(index % 2 == 1) {
                                    ShareLink(item: element.images.fixedWidth.url ?? "") {
                                        GifView(gif: element).frame(height:250).onAppear {
                                            loader.loadResultsIfNecessary(id: element.id)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GifList_Previews: PreviewProvider {
    static var previews: some View {
        GifList(loader:GifLoader())
    }
}
