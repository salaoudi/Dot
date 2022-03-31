//
//  ThemeManager.swift
//  Dot
//
//  Created by Zayn on 1/19/22.
//


//THEME SETTINGS
//SETTING FORKEY INTO USERDEFAULTS
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var theme: Int = UserDefaults.standard.integer(forKey: "ThemeModal") {
        
        didSet {
            UserDefaults.standard.setValue(self.theme, forKey: "ThemeModal")
        }
        
    }
    
}
