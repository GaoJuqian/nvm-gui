//
//  ContentView.swift
//  nvm-gui
//
//  Created by shui ren on 2023/3/14.
//

import SwiftUI

struct ContentView: View {
    @State private var list:Array<String>?
    
    
    
    var body: some View {
        VStack {
//            Button {
//
//            } label: {
//                Text("ads")
//            }.buttonStyle(.borderedProminent)

            List {
                    Text("A Second List Item")
                    Text("A Third List Item")
                }
        }
        .frame(width: .infinity, height: .infinity)
        .background(Color(.gray))
        .padding()
        .animation(.easeInOut, value: list)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
