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
    @State private var up = false
    var onTap: () -> ()
    @State private var isDragging = false


//    var drag: some Gesture {
//        DragGesture()
//            .onChanged { _ in self.isDragging = true }
//            .onEnded { _ in self.onTap }
//    }
    
    
//    func onTap(){
//        up.toggle()
//    }
//
    var body: some View {
        VStack{
            HStack {
                if (up){
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                else {
                    Image(systemName: "chevron.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
            }//.frame(width: UIScreen.main.bounds.size.width, height: 30)
            //.gesture(DragGesture().onEnded(self.onTap)
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
                .navigationBarTitle("").navigationBarHidden(true)
                .animation(nil)
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
