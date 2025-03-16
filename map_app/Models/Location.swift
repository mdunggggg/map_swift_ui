//
//  Location.swift
//  map_app
//
//  Created by ImDung on 16/3/25.
//

import Foundation
import MapKit

struct Location : Identifiable{
    let name: String
    let cityName : String
    let coordinates: CLLocationCoordinate2D
    let description : String
    let imageNames: [String]
    let link : String
    
    var id : String {
        name + cityName
    }
}
