//
//  map_appApp.swift
//  map_app
//
//  Created by ImDung on 16/3/25.
//

import SwiftUI

@main
struct map_appApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
