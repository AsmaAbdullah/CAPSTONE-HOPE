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
            ["title":"Tafaul Association", "latitude": 25.393706, "longitude":49.574475],
            ["title":"National Center for Mental Health Promotion", "latitude": 24.69341726886378, "longitude":46.66055704995945],
            ["title":"Atfalona Association", "latitude": 24.7361111, "longitude":46.7080833],
            ["title":"Amass Association Friends of Cancer Patients", "latitude": 24.683100555514645, "longitude":46.67675366044288],
            ["title":"Saudi Cancer Society", "latitude": 24.674782911558875, "longitude":46.66285893160647],
            ["title":" Tahoor Association", "latitude": 26.117814171216015, "longitude":44.00344161475861],
            ["title":"Sanad Children's Cancer Support Association", "latitude": 24.686987101166228, "longitude":46.648818231606434],
            ["title":"Balsam Association", "latitude": 26.360818413816798, "longitude":43.95468145855508]
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
