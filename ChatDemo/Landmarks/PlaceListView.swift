//
//  PlaceListView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/16/22.
//
import UIKit
import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [Landmark]
    var onTap: () -> ()
    @State private var up = false
    
    
    var body: some View {
        VStack() {
            HStack {
                Image(systemName: "chevron.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }//.frame(width: UIScreen.main.bounds.size.width, height: 30)
                .gesture(TapGesture()
                    .onEnded(self.onTap)
            )
            NavigationView{
                List {
                    ForEach(self.landmarks, id: \.id) { landmark in
                        NavigationLink{
                            CheckInView(landmark: landmark)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(landmark.name)
                                    .fontWeight(.bold)
                                
                                Text(landmark.title)
                            }
                        }
                    }
                }
                .navigationTitle("Check In")
            }
            
        }
        .background(Color(UIColor.systemGray6))
        .cornerRadius(15)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
