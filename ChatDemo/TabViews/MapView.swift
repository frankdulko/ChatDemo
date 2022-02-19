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
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
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
        request.naturalLanguageQuery = "coffee"
        
        let search = MKLocalSearch(request: request)
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
