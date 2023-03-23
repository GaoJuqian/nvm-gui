//
//  ContentView.swift
//  nvm-gui
//
//  Created by shui ren on 2023/3/14.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var out:String?
    
    
    
    var body: some View {
        Text(out ?? "null")
            .padding()
            .onAppear {
                Nvm.ls(true)

            }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
