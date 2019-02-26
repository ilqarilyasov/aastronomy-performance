//
//  FilterPhotoOperation.swift
//  Astronomy
//
//  Created by Ilgar Ilyasov on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FilterPhotoOperation: Operation {
    
    // What kind of information?
    private(set) var image: UIImage?
    let fetchOperation: FetchPhotoOperation
    
    init(fetchOperation: FetchPhotoOperation) {
        self.fetchOperation = fetchOperation
        super.init()
    }
    
    override func main() {
        // Do background work
        
        if let data = fetchOperation.imageData,
            let image = UIImage(data: data) {
            self.image = image.filtered()
        }
    }
    
}
