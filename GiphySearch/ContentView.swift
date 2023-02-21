//
//  ContentView.swift
//  GiphySearch
//
//  Created on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var loader = GifLoader()
    var body: some View {
        VStack {
            Text("Gif Search").padding(.horizontal)
            SearchBar(loader: loader).padding(.horizontal)
            GifList(loader: loader).padding(.top)
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
