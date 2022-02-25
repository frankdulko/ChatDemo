//
//  WriteView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/20/22.
//

import SwiftUI
import UIKit

struct WriteView: View {
    @State private var placeholder = "What's happening?"
    @State private var post = "What's happening?"
    @FocusState var autoFocus: Bool
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack{
            HStack{
                Button {
                    autoFocus = true
                    print(autoFocus)
                } label: {
                    Text("Cancel")
                }
                .padding()
                Spacer()
                Button {
                    
                } label: {
                    Text("Post")
                }
                .padding()
                
            }
            .padding()

            TextEditor(text: $post)
                .padding()
                .frame(width: UIScreen.main.bounds.width-50, height: 300)
                .focused($autoFocus)
                .onTapGesture {
                    if self.post == placeholder {
                    self.post = ""
                    }
                }
                .onAppear {
                    autoFocus = true
                }
            Spacer()
        }
        .background(Color(UIColor.systemGray5))
        .onAppear {
            autoFocus = true
            print(autoFocus)
        }
    }
        
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
