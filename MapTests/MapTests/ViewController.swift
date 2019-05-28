//
//  ViewController.swift
//  MapTests
//
//  Created by Gabriel Zanatto Salami on 22/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    let pucLocation = CLLocation(latitude: -30.08593446, longitude: -51.1734912)
    let veppoLocation = CLLocation(latitude: -30.0237718, longitude: -51.2199073)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        mapView.delegate = self
        setupLocationManager()
        
        let puc = MapLocation(title: "PUC", coordinate: pucLocation.coordinate)
        let veppo = MapLocation(title: "Rodô", coordinate: veppoLocation.coordinate)
        
        mapView.addAnnotations([puc, veppo])
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(recognizer:)))
        mapView.addGestureRecognizer(recognizer)
        
    }

    @objc func didTap(recognizer: UITapGestureRecognizer) {
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: pucLocation.coordinate))
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: veppoLocation.coordinate))
        
        
    }
    
    func setupLocationManager() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            startUpdating(locationManager)
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func startUpdating(_ manager: CLLocationManager) {
        manager.startUpdatingLocation()
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            startUpdating(manager)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
}

