import StreamChat
import StreamChatSwiftUI
import UIKit
import SwiftUI
import MapKit

class AppDelegate: NSObject, UIApplicationDelegate {
        
    var streamChat: StreamChat?
    
    var chatClient: ChatClient = {
        var config = ChatClientConfig(apiKey: .init("8br4watad788"))
        config.applicationGroupIdentifier = "group.com.frankdulko.ChatDemo"
        
        let client = ChatClient(config: config)
        return client
    }()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        var colors = ColorPalette()
        colors.tintColor = Color.red

        //let appearance = Appearance(colors: colors)

        //let streamChat = StreamChat(chatClient: chatClient, appearance: appearance)
        
        connectUser()
        
        return true
    }
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
      ) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self // 👈🏻
        return sceneConfig
      }
    
    
    private func connectUser() {
            // This is a hardcoded token valid on Stream's tutorial environment.
            let token = try! Token(rawValue: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.kFSLHRB5X62t0Zlc7nwczWUfsQMwfkpylC6jCUZ6Mc0")

            // Call `connectUser` on our SDK to get started.
            chatClient.connectUser(
                    userInfo: .init(id: "luke_skywalker",
                                    name: "Luke Skywalker",
                                    imageURL: URL(string: "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg")!),
                    token: token
            ) { error in
                if let error = error {
                    // Some very basic error handling only logging the error.
                    log.error("connecting the user failed \(error)")
                    return
                }
            }
        }
    
    
}
