//
//  NearbyLandmarks.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/15/22.
//

import Foundation
import MapKit

struct NearbyLandmarks{
    let currentLocation: MKMapItem?
    

    init(){
        currentLocation = MKMapItem.forCurrentLocation()
    }
    
    func getNearbyLandmarks() -> [Landmark]{
        var nearbyLandmarks: [Landmark] = [Landmark]()

        let latLong: CLLocationCoordinate2D = currentLocation?.placemark.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let pointOfInterest = MKLocalPointsOfInterestRequest(center: latLong, radius: 50)
        pointOfInterest.pointOfInterestFilter = MKPointOfInterestFilter(including: [
            MKPointOfInterestCategory.brewery,
            MKPointOfInterestCategory.cafe,
            MKPointOfInterestCategory.nightlife,
            MKPointOfInterestCategory.restaurant,
            MKPointOfInterestCategory.winery])
        let search = MKLocalSearch(request: pointOfInterest)
        search.start { (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                nearbyLandmarks = mapItems.map{
                    Landmark(placemark: $0.placemark)
                }
            }
        }
        return nearbyLandmarks
    }
    
}
