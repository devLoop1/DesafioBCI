//
//  AlbumInteractor.swift
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

protocol AlbumBusinessLogic
{
  func doSomething(request: Album.Something.Request)
}

protocol AlbumDataStore
{
  var collectionID: Int { get set }
}

class AlbumInteractor: AlbumBusinessLogic, AlbumDataStore
{
  var presenter: AlbumPresentationLogic?
  var worker: AlbumWorker?
  var collectionID: Int = 0
  
  // MARK: Do something
  
  func doSomething(request: Album.Something.Request)
  {
    worker = AlbumWorker()
    worker?.doSomeWork()
    
    let response = Album.Something.Response()
    presenter?.presentSomething(response: response)
  }
}