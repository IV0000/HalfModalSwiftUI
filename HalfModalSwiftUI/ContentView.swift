//
//  ContentView.swift
//  HalfModalSwiftUI
//
//  Created by Ivan Voloshchuk on 25/03/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var selectedPrivacy : String
    @State private var field1Toggle = false
    @State private var field2Toggle = false
    @State private var field3Toggle = false
    
    enum Privacy : String{
        case privacyPublic = "Public"
        case privacyFriends = "Friends"
        case privacyPrivate = "Private"
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Privacy")
                .fontWeight(.semibold)
                .font(.system(size:24))
            
            Text("Who can see this post")
                .foregroundColor(Color.gray)
            
            VStack(alignment: .leading){
                
                Divider()
                Button(){
                    selectedPrivacy = Privacy.privacyPublic.rawValue
                    field1Toggle.toggle()
                    field2Toggle = false
                    field3Toggle = false
                } label:{
                    HStack{
                        Image(systemName: "network")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(field1Toggle ? .accentColor : .primary)
                        VStack(alignment: .leading){
                            Text("Public")
                                .font(.system(size: 20))
                                .foregroundColor(field1Toggle ? .accentColor : .primary)
                            Text("Anyone will see this post")
                                .font(.system(size: 15))
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        
                    }
                }
                
                Divider()
                Button(){
                    selectedPrivacy = Privacy.privacyFriends.rawValue
                    field1Toggle = false
                    field2Toggle.toggle()
                    field3Toggle = false
                } label:{
                    HStack{
                        Image(systemName: "person.2.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(field2Toggle ? .accentColor : .primary)
                        VStack(alignment: .leading){
                            Text("Friends")
                                .font(.system(size: 20))
                                .foregroundColor(field2Toggle ? .accentColor : .primary)
                            Text("Only your friends will see this post")
                                .font(.system(size: 15))
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        
                    }
                }
                
                Divider()
                
                Button(){
                    selectedPrivacy = Privacy.privacyPrivate.rawValue
                    field1Toggle = false
                    field2Toggle = false
                    field3Toggle.toggle()
                } label:{
                    HStack{
                        Image(systemName: "lock.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(field3Toggle ? .accentColor : .primary)
                        VStack(alignment: .leading){
                            Text("Private")
                                .font(.system(size: 20))
                                .foregroundColor(field3Toggle ? .accentColor : .primary)
                            Text("Only you will see this post")
                                .font(.system(size: 15))
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                }
                Divider()
            }
        }.padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
