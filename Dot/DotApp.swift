//
//  DotApp.swift
//  Dot
//
//  Created by Zayn on 12/26/21.
//

import SwiftUI

import Foundation



@main
struct DotApp: App {
  
    var body: some Scene {
        
        WindowGroup {
            
            ContentView()
                .environmentObject(StorageManager.shared)
             
        }
    
}


}
