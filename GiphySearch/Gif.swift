//
//  Gif.swift
//  GiphySearch
//
//  Created by [interview candidate] on 2/16/23.
//

import Foundation

struct Gif: Decodable, Hashable, Identifiable {
    let id: String
    let url: String
    var images: Images
}

struct Images: Decodable, Hashable {
    let original: GifImage
    let downsizedMedium: GifImage
    let fixedHeight: GifImage
    let fixedWidth: GifImage
}

struct GifImage: Decodable, Hashable {
    let height: String
    let width: String
    let size: String
    let url: String?
}
