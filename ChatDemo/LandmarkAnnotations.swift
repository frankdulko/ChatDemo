//
//  LandmarkAnnotations.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/16/22.
//

import MapKit
import UIKit


final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
