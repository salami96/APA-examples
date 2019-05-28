//
//  mapLocation.swift
//  MapTests
//
//  Created by Gabriel Zanatto Salami on 22/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import MapKit

class MapLocation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    var title : String?
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
        super.init()
    }
    
    var subtitle: String? {return "I'm at \(coordinate)"}
}
