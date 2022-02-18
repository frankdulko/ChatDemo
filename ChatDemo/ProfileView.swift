//
//  ProfileView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/15/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("username")
            }
            .navigationTitle("Profile")
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
