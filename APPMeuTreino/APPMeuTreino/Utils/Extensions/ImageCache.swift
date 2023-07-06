//
//  ImageCache.swift
//  TesteImage
//
//  Created by Bruno Moura on 04/02/23.
//

import UIKit

class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    private let cacheQueue = DispatchQueue(label: "ImageCache.ioQueue")
    
    private init() {
        cache.countLimit = 1000
    }
    
    func clearCache() {
        cacheQueue.async {
            self.cache.removeAllObjects()
        }
    }
    
    func setCacheLimited(value: Int) {
        cache.countLimit = value
    }
    
    func setImage(image: UIImage, forKey key: String) {
        cacheQueue.async {
            self.cache.setObject(image, forKey: key as NSString)
        }
    }
    
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
}
