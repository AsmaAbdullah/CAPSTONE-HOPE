//
//  LocationsVC.swift
//  HOPE
//
//  Created by Asma on 11/12/2021.
//

import UIKit
import MapKit

class LocationsVC: UIViewController {
    
    @IBOutlet weak var mapAssociations: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationMapKit()
    }
    
    
    func locationMapKit() {
        let locations = [
            ["title":"Basma Association", "latitude": 27.521646, "longitude":41.657139],
            ["title":"Zahra Association", "latitude": 24.671401, "longitude":46.668314],
            ["title":"Saudi Cancer Society", "latitude": 24.674666, "longitude":46.662880],
            ["title":"Al-Iman Association", "latitude": 21.514247, "longitude":39.168380],
            ["title":" Tafaul Association", "latitude": 25.393706, "longitude":49.574475]
        ]
        
        
        
        for location in locations {
            let annotationn = MKPointAnnotation()
            annotationn.title = location["title"] as? String
            let loc = CLLocationCoordinate2D(latitude: location["latitude"] as! Double,longitude: location["longitude"] as! Double )
            
            annotationn.coordinate = loc
            mapAssociations.addAnnotation(annotationn)
        }
    }
    
    
    
}
