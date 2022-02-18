//
//  CheckInView().swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/16/22.
//

import SwiftUI

struct CheckInView: View {
    var landmark: Landmark
    var body: some View {
        VStack{
            Text(landmark.name)
            Text(landmark.title)
            Divider()
            Spacer()
            Button {
                
            } label: {
                
            }

        }
        
        .background(Color(UIColor.systemGray6))
    }
}
