//
//  LocationsListView.swift
//  map_app
//
//  Created by ImDung on 16/3/25.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                listRowView(location: location)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            vm.currentLocation = location
                        }
                    }
            }
        }
        .listStyle(PlainListStyle.plain)
    }
}

extension LocationsListView {
    private func listRowView(location : Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
