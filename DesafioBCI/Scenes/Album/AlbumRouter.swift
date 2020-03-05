//
//  AlbumRouter.swift
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

@objc protocol AlbumRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol AlbumDataPassing {
    var dataStore: AlbumDataStore? { get }
}

class AlbumRouter: NSObject, AlbumRoutingLogic, AlbumDataPassing {
    weak var viewController: AlbumViewController?
    var dataStore: AlbumDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: AlbumViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: AlbumDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
