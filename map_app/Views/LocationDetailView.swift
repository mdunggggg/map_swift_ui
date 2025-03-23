//
//  LocationDetailView.swift
//  map_app
//
//  Created by ImDung on 23/3/25.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    let location : Location
    @EnvironmentObject var vm : LocationsViewModel
    
    
    var body: some View {
        ScrollView {
            VStack {
                TabView {
                    ForEach(location.imageNames,id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .clipped()
                            
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle())
            }
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
            
            VStack(alignment: .leading, content: {
                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(location.cityName)
                    .font(.title3)
                    .foregroundColor(.secondary)
            })
            .padding(.all, 6)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Divider()
            
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.all, 6)
            
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
                    .padding(.all, 6)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span:  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
                ), annotationItems: [location]) { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .shadow(radius: 10)
                }
            }
                .allowsHitTesting(false)
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(30)
                .padding()
            
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            Button(action: {
                vm.sheetLocation = nil
            }, label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .padding(12)
                    .foregroundColor(.primary)
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .padding()
            })
        }
    }
}

#Preview {
    LocationDetailView(location: LocationsDummy.locations.first!)
        .environmentObject(LocationsViewModel())
}
