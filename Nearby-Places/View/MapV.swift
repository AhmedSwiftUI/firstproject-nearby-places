//
//  MapV.swift
//  Nearby-Places
//
//  Created by Ahmed Alharbi on 21/09/1442 AH.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapV
    
    init(_ control: MapV) {
        self.control = control
    }
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let noteView = views.first {
            if let annotation = noteView.annotation {
                if annotation is MKUserLocation {
                    
                    // region مسؤول عن الزووم ان والزووم اوت
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500 , longitudinalMeters: 500)
                    
                    // setRegion:يغير المنطقة الحالية وينشط المنطقة اختياريا
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
    }
    
}

struct MapV: UIViewRepresentable {
    
    let marks: [Sign]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate =  context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateNoteses(mapV: uiView)
    }
    
    // الفنكشن updateNoteses مسؤول عن حذف التعليقات والتوضيحات في خانة البحث
 private func updateNoteses(mapV: MKMapView) {
    mapV.removeAnnotations(mapV.annotations)
        let annorations = self.marks.map(Notes.init)
        mapV.addAnnotations(annorations)
    }
}
