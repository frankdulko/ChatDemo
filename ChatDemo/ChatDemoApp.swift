//
//  ChatDemoApp.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/14/22.
//

import SwiftUI

import StreamChat
import StreamChatSwiftUI

@main
struct ChatDemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            //ChatChannelListScreen(title: "Frank's Chat")
            ContentView()
        }
    }
}
