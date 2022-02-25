//
//  PostView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/18/22.
//

import SwiftUI
import UIKit

struct PostView: View {
    @EnvironmentObject var memoryModel: MemoryModel
    @State var showWriteView = false
    var body: some View {
            ZStack{
                //if(memoryModel.user.checkedIn){
                    VStack{
                            Text(memoryModel.user.location)
                            .font(Font.headline)
                            ScrollView{
                                VStack{
                                    ForEach(0 ..< 10) { index in
                                        Post()
                                    }
                                    .padding(.all, 0)
                                }
                            }
                            .clipped()
                        }
                        Button(action: {
                            self.showWriteView.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding()
                                .cornerRadius(15)
                            
                        })
                            .sheet(isPresented: $showWriteView, content: {
                                WriteView()
                            })
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(30)
                        .position(x: UIScreen.main.bounds.width - 60, y: UIScreen.main.bounds.height - 200)
//                    }
//                else{
//                    VStack {
//                        Text("Check In To View A Location's Board")
//                            .font(Font.largeTitle)
//                    }
//                }
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
            VStack{
                Text("Hello")
                    .padding()
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color(UIColor.systemGray))
                }
                .padding()
            }
            
            Spacer()
            VStack(alignment: .center){
                Button {
                    
                } label: {
                    Image(systemName: "chevron.up")
                        .foregroundColor(Color(UIColor.systemGray))
                }
                .padding()
                Text("0")
                Button {
                    
                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color(UIColor.systemGray))
                }
                .padding()
            }
            
        }
        .background(Color(UIColor.systemGray6))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}
