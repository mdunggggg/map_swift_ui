//
//  LocationPreviewView.swift
//  map_app
//
//  Created by ImDung on 18/3/25.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location : Location
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading){
                imageSection
                titleSection
                
            }
            
            VStack(spacing: 8){
                Button(action: {
                    
                }, label: {
                    Text("Learn more")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 125, height: 35)
                        .padding(.all, 6)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                
                Button(action: {
                    vm.nextButtonPressed()
                }, label: {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.red)
                        .frame(width: 125, height: 35)
                        .padding(.all,6)
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                })
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipped()
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.7), radius: 20)
    }
}

extension LocationPreviewView {
    private var imageSection : some View {
        ZStack{
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .padding(.all, 6)
                    .background(Color.white)
                    .cornerRadius(16)
            }
        }
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    LocationPreviewView(location: LocationsDummy.locations.first!)
        .environmentObject(LocationsViewModel())
}
