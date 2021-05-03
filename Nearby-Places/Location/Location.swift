//
//  Location.swift
//  Nearby-Places
//
//  Created by Ahmed Alharbi on 21/09/1442 AH.
//


import Foundation
import MapKit

// الكلاس Location يورث من NSObject و ObservableObject عشان نتمكن من الوصول للموقع
class TheLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    private let locationControl = CLLocationManager()
    var location: CLLocation? = nil
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
       
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last
        else {
            return
        }
        self.location = location
    }
    
    
    override init() {
        
        super.init()
        self.locationControl.delegate = self
        self.locationControl.desiredAccuracy = kCLLocationAccuracyBest
        self.locationControl.distanceFilter = kCLDistanceFilterNone
        self.locationControl.requestWhenInUseAuthorization()
        self.locationControl.startUpdatingLocation()
     
    }
    
}


