//
//  GifView.swift
//  GiphySearch
//
//  Created by [interview candidate] on 2/17/23.
//

import Foundation
import SwiftyGif
import UIKit
import SwiftUI

struct GifView: UIViewRepresentable {
    let gif: Gif
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        guard let url = URL(string: gif.images.fixedWidth.url!) else { return imageView }
         
        let loader = UIActivityIndicatorView(style: .medium)
        imageView.setGifFromURL(url, customLoader: loader)
        return imageView
    }
    
    func updateUIView(_ imageView: UIImageView, context: Context) {
        imageView.startAnimatingGif()
    }
    
  
}
 
