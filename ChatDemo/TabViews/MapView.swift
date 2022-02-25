//
//  MapView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/15/22.
//

import SwiftUI
import MapKit
import StreamChat

struct MapView: View {
    
    //@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @EnvironmentObject var memoryModel:MemoryModel
    @StateObject var locationManager = LocationManager()
    
    @State private var landmarks: [Landmark] = [Landmark]()
    
    @State private var tapped: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
//                List{
//                    NavigationLink{
//                        CheckInView()
//                    } label: {
//                        Text("Check In")
//                    }
//                }
//                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
//                    .onAppear(perform: showNearbyLandmarks)
                MapHandler(landmarks: landmarks)
                
                
                PlaceListView(landmarks: self.landmarks) {
                                // on tap
                                self.tapped.toggle()
                }.offset(y: calculateOffset()).animation(.spring(), value: self.tapped)
                
            }.onAppear(perform: showNearbyLandmarks)
        .navigationTitle("Map")
        }
    }
    
    func showNearbyLandmarks(){
        print("Map Appeared")
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "bars"
        
        let region = MKCoordinateRegion(center: locationManager.getCurrentLocation(), latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let pointOfInterest = MKLocalPointsOfInterestRequest(coordinateRegion: region)
        pointOfInterest.pointOfInterestFilter = MKPointOfInterestFilter(including: [
            MKPointOfInterestCategory.brewery,
            MKPointOfInterestCategory.cafe,
            MKPointOfInterestCategory.nightlife,
            MKPointOfInterestCategory.restaurant,
            MKPointOfInterestCategory.winery])
        let search = MKLocalSearch(request: pointOfInterest)
        
        //let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark: $0.placemark)
                }
                
            }
            
        }
    }
    
    func calculateOffset() -> CGFloat {

            
        if self.landmarks.count > 0 && !self.tapped {
            print(UIScreen.main.bounds.size.height - 500)
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height/2
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject{
    
    var locationManager = CLLocationManager()
    private var currentLocation = CLLocationCoordinate2D()
    
    override init(){
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        currentLocation = locValue
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    func getCurrentLocation() -> CLLocationCoordinate2D{
        return currentLocation
    }
}
