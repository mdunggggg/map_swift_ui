//
//  LocationsViewModel.swift
//  map_app
//
//  Created by ImDung on 16/3/25.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel : ObservableObject {
    
    @Published var locations : [Location]
    @Published var currentLocation : Location {
        didSet {
            updateMapRegion(location: currentLocation)
        }
    }
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    
    @Published var showLocationsList : Bool = false
    
    init() {
        let locations = LocationsDummy.locations
        self.locations = locations
        self.currentLocation = locations.first!
        self.updateMapRegion(location: currentLocation)
    }
    
    private func updateMapRegion(location : Location) {
        mapRegion = MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    
}
