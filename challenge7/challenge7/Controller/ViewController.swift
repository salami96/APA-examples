//
//  ViewController.swift
//  challenge7
//
//  Created by Gabriel Zanatto Salami on 22/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

import UIKit
import CoreLocation
import MapKit

final class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var mapView: MKMapView!
    
    var userLocation = CLLocation()
    var destinationLocation = CLLocation()
    
    let locationManager = CLLocationManager()
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        setupMapView()
        setupTapGesture()
    }
    
    func didTap() {
        let userPlacemark = MKPlacemark(coordinate: userLocation.coordinate)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation.coordinate)
        
        let userMapItem = MKMapItem(placemark: userPlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = userMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (response, error) in
            guard let response = response else { fatalError() }
            
            let route = response.routes.first!
            self.mapView.removeOverlays(self.mapView.overlays)
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            let largerRect = MKMapRect(origin: rect.origin, size: MKMapSize(width: rect.size.width*1.1, height: rect.size.height*1.1))
            self.mapView.setVisibleMapRect(largerRect, animated: true)
        }
    }
    
    private func updateLocation() {
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            updateLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension ViewController {
    
    private func setupMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        // Center Map
        centerMap(on: userLocation.coordinate)

    }
    
    private func setupTapGesture() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap(recognizer:)))
        mapView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        
        let location = recognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        // Add pin
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            updateLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        userLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        centerMap(on: userLocation.coordinate)
    }
}


// MARK: - Map View Delegate
extension ViewController: MKMapViewDelegate {
    
    private func centerMap(on coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        mapView.setRegion(region, animated: false)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapLocation else { return nil }
        
        let id = "marker"
        let view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: id)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: -5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        destinationLocation = CLLocation(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
        didTap()
        mapView.removeAnnotation(mapView.annotations.last!)
        
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .red
        renderer.lineWidth = 4
        return renderer
        
    }
}


