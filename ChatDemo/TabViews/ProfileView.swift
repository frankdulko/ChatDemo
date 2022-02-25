//
//  ProfileView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/15/22.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var memoryModel:MemoryModel
    
    @State private var photo = UserDefaults.standard.string(forKey: "profilePhoto") ?? "person.crop.circle.fill"
    @State private var username = UserDefaults.standard.string(forKey: "username") ?? "set username"
    @State private var location = UserDefaults.standard.string(forKey: "location") ?? "Check in to set location"

    
    
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: memoryModel.user.profilePicture)
                    .resizable()
                    .frame(width: 200, height: 200)
                Text(memoryModel.user.username)
                Text(memoryModel.user.location)
            }
            .navigationTitle("Profile")
            .clipped()
        }

//        .onAppear {
//            photo = UserDefaults.standard.string(forKey: "profilePhoto") ?? "person.crop.circle.fill"
//            username = UserDefaults.standard.string(forKey: "username") ?? "set username"
//            location = UserDefaults.standard.string(forKey: "location") ?? "Check in to set location"
//        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
