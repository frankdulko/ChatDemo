//
//  PostView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/18/22.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0 ..< 10) { index in
                    Post()
                }
                .padding()
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

struct Post: View{
    var body: some View {
        HStack{
            Text("Hello")
                .padding()
            Spacer()
            VStack(alignment: .center){
                Button {
                    
                } label: {
                    Image(systemName: "chevron.up")
                }
                .padding()
                Text("0")
                Button {
                    
                } label: {
                    Image(systemName: "chevron.down")
                }
                .padding()
            }
        }
        .cornerRadius(20)
        .border(.blue)
    }
}
