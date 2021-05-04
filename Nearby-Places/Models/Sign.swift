//
//  Sign.swift
//  Nearby-Places
//
//  Created by Ahmed Alharbi on 22/09/1442 AH.
//

import Foundation
import MapKit

//   كلاس Sign نسند له خصائص ونعطيه اسم وعنوان وابعاد وغيره
struct Sign {
    let place: MKPlacemark
    
    var name: String {
        self.place.name ?? ""
    }
    
    // المتغير coordinate نعطيه نوع بيانات من نوع CLLocationCoordinate2D عشان نحدد خط الطول والعرض
    var coordinate: CLLocationCoordinate2D {
    self.place.coordinate
        
    }
    
    // اعطينا المعرف ال id نوع بيانات من نوع UUID اللي بيعطينا ارقام تسلسلية ومعرفة عالميا وبشكل عشوائي
    var id: UUID {
        return UUID()
    }
}


// الكلاس Notes يظهر لنا الملاحظات على الخارطة
class Notes: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    init(sign: Sign) {
        self.title = sign.name
        self.coordinate = sign.coordinate
    }
    
}
