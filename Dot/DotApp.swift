//
//  DotApp.swift
//  Dot
//
//  Created by Zayn on 12/26/21.
//



import SwiftUI
import Foundation

//MAIN APP
@main
struct DotApp: App {
  
    var body: some Scene {
        
        WindowGroup {
            
            ContentView()
                .environmentObject(StorageManager.shared)
             
        }
    
}


}
