//
//  CheckInView().swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/16/22.
//

import SwiftUI
import MapKit

struct CheckInView: View {
    
    @EnvironmentObject var memoryModel: MemoryModel
    
    var landmark: Landmark
    @State private var isOn = false
    var body: some View {
        VStack{
            Text(landmark.name)
            Text(landmark.title)
            Toggle(isOn: $isOn){
                Text("Check In")
            }.onDisappear{
                if (isOn){
                    memoryModel.user.location = landmark.name
                    memoryModel.user.checkedIn = true
                }
            }
        }
    }
}
