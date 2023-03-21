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
    
    func shell(_ args: String...) -> Int32 {
      let task = Process()
      task.launchPath = "/bin/zsh"
      task.arguments = args
      task.launch()
      task.waitUntilExit()
      return task.terminationStatus
    }
    
    var body: some View {
        Text(out ?? "null")
            .padding()
            .onAppear {
                print(shell("-l", "-c", "echo $HOME; nvm list"))

                // /Users/gjq/Library/Containers/com.gaojuqian.nvm-gui/Data
                // zsh:1: command not found: nvm
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
