//
//  AlbumModels.swift
//  DesafioBCI
//
//  Created by Jose on 05-03-20.
//  Copyright (c) 2020 dev_Jo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Album {
    // MARK: Use cases
    
    enum Load {
        struct Request {
        }
        struct Response {
            let album: [AlbumModel]
        }
        struct ViewModel {
            let album: [AlbumModel]
        }
    }
}
