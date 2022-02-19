//
//  ContentView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/14/22.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        TabView{
            PostView()
                .tabItem {
                    Label("Board", systemImage: "list.dash")
                }
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
            MapView()
                .tabItem{
                    Label("Map", systemImage: "map")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.crop.circle")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
