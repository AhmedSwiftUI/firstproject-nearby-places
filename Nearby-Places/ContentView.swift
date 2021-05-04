//
//  ContentView.swift
//  Nearby-Places
//
//  Created by Ahmed Alharbi on 21/09/1442 AH.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var locationC = TheLocation()
    @State private var search: String = ""
    @State private var sign:[Sign] = [Sign]()
    
    private func nearbyPlaces() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.search
        
        let search = MKLocalSearch(request: request)
        search.start { (response,error) in
            
            //  هنا اذا كان فيه خطأ راح يكون الresponse هو المسؤول عن الاخطاء
            if let response = response {
                let map = response.mapItems
                self.sign = map.map {
                    Sign(place: $0.placemark)
                }
            }
        }
    }
    var body: some View {
        
        ZStack(alignment: .top) {
            
            MapV(marks: sign )
            
            TextField("ابحث هنا", text: $search, onEditingChanged: { a in})
            {
                self.nearbyPlaces()
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
