//
//  ContentView.swift
//  HalfModalSwiftUI
//
//  Created by Ivan Voloshchuk on 25/03/22.
//

import SwiftUI

struct MainView: View {
    @State var selectedPrivacy = "Privacy"
    
    var body: some View {
        
        VStack{
            Spacer()
            HStack{
                HalfModal(label: $selectedPrivacy, detents: [.medium()], grabber: true) {
                    /// The content of your half modal
                    ContentView(selectedPrivacy: $selectedPrivacy)
                        .padding(.top,30)
                    Spacer()
                }
                .fixedSize(horizontal: true, vertical: true)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
