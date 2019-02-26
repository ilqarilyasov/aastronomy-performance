//
//  PhotoCache.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class Cache<Key: Hashable, Value> {
    
    func cache(value: Value, for key: Key) {
        queue.async {
            self.cache[key] = value
        }
    }
    
    func value(for key: Key) -> Value? {
        return queue.sync { cache[key] }
    }
    
    func clearCache() {
        queue.async {
            self.cache.removeAll()
        }
    }
    
    private var cache = [Key : Value]() {
        didSet {
            if cache.count == 100 {
                cache.removeAll()
            }
        }
    }
    private let queue = DispatchQueue(label: "com.LambdaSchool.Astronomy.CacheQueue")
}
