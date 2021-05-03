//
//  ContentView.swift
//  Nearby-Places
//
//  Created by Ahmed Alharbi on 21/09/1442 AH.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationC = TheLocation()
    @State private var search: String = ""
    
    private func NearbyPlaces() {
        
       
        
        
    }
    var body: some View {
        
        ZStack(alignment: .top) {
            
            MapV()
            
            TextField("ابحث هنا", text: $search, onEditingChanged: { a in})
            
            
            {
               
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
