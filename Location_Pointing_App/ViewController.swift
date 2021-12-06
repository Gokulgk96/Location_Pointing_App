//
//  ViewController.swift
//  Location_Pointing_App
//
//  Created by Gokul Gopalakrishnan on 06/12/21.
//


import CoreLocation
import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

   
    @IBOutlet weak var mapview: MKMapView!
    
    let Manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Manager.desiredAccuracy = kCLLocationAccuracyBest
        Manager.delegate = self
        Manager.requestWhenInUseAuthorization()
        Manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        if let location = locations.first
        {
        Manager.stopUpdatingLocation()
            render(location)
        }
        
    }

    
    func render( _ location : CLLocation)
    {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapview.setRegion(region, animated: true)
        
    
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        
        
        pin.title = "first test"
        pin.subtitle = "second test"
        
        mapview.addAnnotation(pin)
        
    
    }

}

