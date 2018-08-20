//
//  ViewController.swift
//  Search Pokenmon
//
//  Created by Harshit Satyaseel on 18/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var mapHasCentredOnce = false
    var geoFire: GeoFire!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        // now to track the user location we have the following:
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
    }
    // we want the user to autheticate the stsus everytime the map appears
    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
    }
    
    func locationAuthStatus(){
        // we want to authorise the status when user uses the app not everytime in the background to save the battery of the user
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true // code for showing the users location
            
        }else{
            // ask the user to authorize so, we have the code is:
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    // ones user has authorised then update the map so,
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            // show the map now:
            mapView.showsUserLocation = true
        }
        
    }
    
    // function to centre the map to the users location for user interaction
    
    func centreMapOnLoation(location: CLLocation){
        
        let myCoordinates =  MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        // set my cureent co-ordinates
        mapView.setRegion(myCoordinates, animated: true)
        
    }
    
    // update the user loaction so,
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // whenever the gps of the phone updates we want to centre the
        
        if let location = userLocation.location {
            // we want the centerd things to be done first time only and that is why we have a global variable defined above as false
            if !mapHasCentredOnce{
                centreMapOnLoation(location: location)
                // true the variable
                mapHasCentredOnce = true
            }
        }
    }
    // function for the dot or the annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // we want to create the custom annotation
        
        var annotationView: MKAnnotationView? // this will be of optional type since location can be nil if user dont give permission for their location
        if annotation.isKind(of: MKUserLocation.self) {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")  
            annotationView?.image = UIImage(named: "ash")
        }
        
        return annotationView
        
        
    }

    

    @IBAction func spotPokemon(_ sender: Any) {
    }
}

