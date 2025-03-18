//
//  LocationsView.swift
//  map_app
//
//  Created by ImDung on 16/3/25.
//

import SwiftUI
import MapKit



struct LocationsView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    @State private var mapRegion : MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                header
                Spacer()
                ForEach(vm.locations) { location in
                    if(vm.currentLocation.id == location.id) {
                        LocationPreviewView(location: vm.currentLocation)
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                    }
                }
            }
            .padding()
        }
    }
}

extension LocationsView {
    private var header : some View {
        VStack {
            Text(vm.currentLocation.name + ", " + vm.currentLocation.cityName)
                .font(.title2)
                .fontWeight(.bold)
                .frame(height: 50)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .leading, content: {
                    Image(systemName: "arrow.down" )
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                })
            if vm.showLocationsList {
                LocationsListView()
            }
          
        }
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 20)
        .onTapGesture {
            vm.toggleLocationsList()
        }
    }
}

#Preview {
    
    LocationsView()
        .environmentObject(LocationsViewModel())
}
