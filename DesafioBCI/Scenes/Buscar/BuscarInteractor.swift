//
//  BuscarInteractor.swift
//  DesafioBCI
//
//  Created by Jose on 04-03-20.
//  Copyright (c) 2020 dev_Jo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BuscarBusinessLogic
{
  func doSomething(request: Buscar.Something.Request)
}

protocol BuscarDataStore
{
  //var name: String { get set }
}

class BuscarInteractor: BuscarBusinessLogic, BuscarDataStore
{
  var presenter: BuscarPresentationLogic?
  var worker: BuscarWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Buscar.Something.Request)
  {
    worker = BuscarWorker()
    worker?.doSomeWork()
    
    let response = Buscar.Something.Response()
    presenter?.presentSomething(response: response)
  }
}