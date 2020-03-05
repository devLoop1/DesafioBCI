//
//  AlbumViewController.swift
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

protocol AlbumDisplayLogic: class {
    func displayInitialData(viewModel: Album.Load.ViewModel)
    
    
}

struct AlbumData {
    var albumName: String
    var artistName: String
    var artWorkUrl: String
}

class AlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AlbumDisplayLogic {
    
    
    var interactor: AlbumBusinessLogic?
    var router: (NSObjectProtocol & AlbumRoutingLogic & AlbumDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = AlbumInteractor()
        let presenter = AlbumPresenter()
        let router = AlbumRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: Componentes view
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var nombreAlbum: UILabel!
    @IBOutlet weak var nombreArtista: UILabel!
    @IBOutlet weak var numeroCanciones: UILabel!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var imageAlbumWith: NSLayoutConstraint!
    @IBOutlet weak var imageAlbumHeight: NSLayoutConstraint!
    
    // MARK: Variables
    var arrayAlbum = [AlbumModel]()
    
    var nombreAlbumVar = ""
    var nombreArtistaVar = ""
    var artWorkVar = ""
    var numeroCancionesVar = 0
    //    var collectionID = router?.dataStore?.collectionID
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialData()
        
        imageAlbumWith.constant     = 60
        imageAlbumHeight.constant   = 60
        
        custom()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nombreArtista.text = nombreArtistaVar
        nombreAlbum.text = nombreAlbumVar
        numeroCanciones.text = "Numero de canciones: \(numeroCancionesVar)"
        
        cargarArtWork()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    
    func loadInitialData() {
        let request = Album.Load.Request()
        interactor?.doLoadInitialData(request: request)
    }
    
    func displayInitialData(viewModel: Album.Load.ViewModel) {
        
        arrayAlbum = viewModel.album
        
        for dataAlbum in arrayAlbum{
            nombreArtistaVar = dataAlbum.artistName
            nombreAlbumVar = dataAlbum.collectionName
            artWorkVar = dataAlbum.artworkUrl100
            numeroCancionesVar = dataAlbum.trackCount
            
        }
        
        
    }
    
    // MARK: Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numeroCancionesVar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cellCancionesAlbum", for: indexPath)
        
        cell.textLabel?.text = "Cancion"
        
        return cell
        
    }
    
    // MARK: Cargar Artwork
    func cargarArtWork(){
        
        if let url = URL(string: artWorkVar) {
            
            do {
                let data = try Data(contentsOf: url)
                
                self.albumImage.image = UIImage(data: data)
                
            } catch let err {
                print("Error : \(err.localizedDescription)")
            }
            
            
        }
        
    }
    
    // MARK: Custom
    
    func custom(){
        
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (_) in
            self.imageAlbumHeight.constant = 100
            self.imageAlbumWith.constant = 100
            
            
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
    }
    
}
