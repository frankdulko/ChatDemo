//
//  PostView.swift
//  ChatDemo
//
//  Created by Frank Dulko on 2/18/22.
//

import SwiftUI

struct PostView: View {
    @EnvironmentObject var memoryModel: MemoryModel
    @State var showWriteView = false
    var body: some View {
        //if(memoryModel.user.checkedIn){
            ZStack{
                VStack{
                    Text(memoryModel.user.location)
                    ScrollView{
                        VStack{
                            ForEach(0 ..< 10) { index in
                                Post()
                            }
                            .padding()
                        }
                    }
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
            }
            .background(Color(UIColor.systemGray5))

//        }
//        else{
//            VStack{
//                Text("Check In To View A Location's Board")
//            }
//        }
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
        .background(.white)
        .cornerRadius(20)
    }
}
