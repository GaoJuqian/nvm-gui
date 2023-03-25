//
//  Nvm.swift
//  nvm-gui
//
//  Created by shui ren on 2023/3/23.
import Foundation
//
//nvm install <version>: 安装指定版本的Node.js。
//nvm use <version>: 切换到指定版本的Node.js。
//nvm uninstall <version>: 卸载指定版本的Node.js。
//nvm ls: 列出已安装的Node.js版本。
//nvm ls-remote: 列出可安装的Node.js版本。
//nvm current: 显示当前使用的Node.js版本。
//nvm alias <name> <version>: 给指定版本的Node.js起一个别名。
//nvm run <version> <script>: 运行指定版本的Node.js来执行脚本。
//nvm exec <version> <command>: 在指定版本的Node.js环境中执行命令。


struct Nvm{
    public static var nvmList: Array<String> = []
    
    private static func shell(_ args: String...) -> String {
        let task = Process()
        task.launchPath = "/bin/zsh"
        task.arguments = args
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            return output
        }
        return ""
        
    }
    
    private static func fmtList(_ shellOut: String) -> Array<String>{
        var nodeVersonList = Array<String>()
        // 分割终端换行
        let fmtShellOut = shellOut.components(separatedBy: "\n")
        for raws in fmtShellOut {
            // 取得vxx.xx.xx
            for rawsItem in raws.components(separatedBy: " "){
                if (rawsItem.first == "v"){
                    print("\(rawsItem)")
                    nodeVersonList.append(rawsItem)
                }
            }
        }
        
        return nodeVersonList
    }
    
    static func ls(_ remote:Bool=false) -> Array<String>{
        let list:String
        if (remote){
            list = shell("-l", "-c", "nvm ls-remote")
            
        }else{
            list = shell("-l", "-c", "nvm ls")
        }
        return fmtList(list)
        
    }
    static func getCurrent() -> String{
        shell("-l", "-c", "nvm current")
    }
    static func use(){
        
    }
    static func install(){
        
    }
    static func uninstall(){
        
    }
}
