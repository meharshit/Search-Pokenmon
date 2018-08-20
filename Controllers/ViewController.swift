//
//  ViewController.swift
//  Search Pokenmon
//
//  Created by Harshit Satyaseel on 18/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var mapHasCentredOnce = false
    var gerFire: GeoFire!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
    }

    

}

