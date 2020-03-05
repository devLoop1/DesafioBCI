//
//  ObtenerDatos.swift
//  DesafioBCI
//
//  Created by Jose on 04-03-20.
//  Copyright © 2020 dev_Jo. All rights reserved.
//

import Foundation

let url_base_cancion = "https://itunes.apple.com/search?entity=song&term="

class ObtenerDatos {
    static let instance = ObtenerDatos()
    
    func getCanciones(searchRequest: String, limite: Int, complition: @escaping ([CancionModel]) -> Void) {
          
          var cancioneS = [CancionModel]()
          
          // remplazo espacio por caracter "+"
          let buscarString = searchRequest.replacingOccurrences(of: " ", with: "+")
          let limite = "&limit=\(limite)"
          
          let url = URL(string: "\(url_base_cancion)\(buscarString)\(limite)")
          
          URLSession.shared.dataTask(with: url!) { (data, response, error) in
              
              if let data = data, let respons = response as? HTTPURLResponse {
                  
                  do {
                      let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                      
                      
                      if let cancionesResultado = json["results"] as? NSArray {
                          for canciones in cancionesResultado{
                              
                              if let cancionInfo = canciones as? [String: AnyObject]{
                                  guard let trackName = cancionInfo["trackName"] as? String else {return}
                                  guard let collectionId = cancionInfo["collectionId"] as? Int else {return}
                                  guard let artistName = cancionInfo["artistName"] as? String else {return}
                                  let cancionInstance = CancionModel(trackName: trackName, collectionId: collectionId, artistName: artistName)
                                  cancioneS.append(cancionInstance)
    
                              }
                          }
                          complition(cancioneS)
                          
                      }
                  } catch {
                      print("Error catch: ", error.localizedDescription)
                  }
                  
                  
                  switch respons.statusCode {
                  case 500...599:
                      print(String(data: data, encoding: .utf8) ?? "No UTF-8 response data")
                  default:
                      print("not 500")
                  }
              }
              if error != nil{
                  print("Error URLSession: ", error!.localizedDescription)
                  
              }
              
              
          }.resume()
          
      }
    
    
}
