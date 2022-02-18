//
//  ChatView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/15/22.
//

import SwiftUI

import StreamChat
import StreamChatSwiftUI

struct ChatView: View {
    var body: some View {
        ChatChannelListScreen(title: "Frank's Chat")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
