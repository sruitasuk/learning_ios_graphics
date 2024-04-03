//
//  ContentView.swift
//  Hello Canvas 1
//
//  Created by Sruit Angkavanitsuk on 20/3/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    var iBird : Image
    var iBG : Image
    
    init() {
        iBird = Image("bird")
        iBG = Image("bg")
    }
    
    var body: some View {
        
        Canvas { context, size in
            context.draw(iBG, in: CGRect(x: 0, y: 0, width: 750, height: 375))
            context.draw(iBird, in: CGRect(x: 50, y: 100, width: 200, height: 200))
        }
      
    }
}
