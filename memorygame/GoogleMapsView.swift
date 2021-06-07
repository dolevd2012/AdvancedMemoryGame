//
//  GoogleMapsView.swift
//  memorygame
//
//  Created by user196688 on 6/7/21.
//

import UIKit
import GoogleMaps
import CoreLocation


class GoogleMapsView: UIViewController,CLLocationManagerDelegate {
    let manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()


        
        
        
        GMSServices.provideAPIKey("AIzaSyBT_TbZe2aON0-H_rn7Xj7mEzonBzweAv0")

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else{
            return
        }
        let coordinates = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView)

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        marker.title = "Your Location"
        marker.map = mapView
    }
    

    
    
}
