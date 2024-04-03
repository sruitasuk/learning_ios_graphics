//
//  ContentView.swift
//  Hello Canvas 2
//
//  Created by Sruit Angkavanitsuk on 20/3/2567 BE.
//

import SwiftUI

var count = 50

struct ContentView: View {
    
    var iBird : Image
    var iBG : Image
    
    init() {
        iBird = Image("bird")
        iBG = Image("bg")
    }
    
    var body: some View {
        TimelineView(.animation) { timelineContext in
            
            var x = updateTime()
            
            Canvas { context, size in
                context.draw(iBG, in: CGRect(x: 0, y: 0, width: 750, height: 375))
                context.draw(iBird, in: CGRect(x: x, y: 100, width: 200, height: 200))
            }
        }
    }
    
    func updateTime() -> Int  {
        count = count + 7
        if count > 800 {
            count = -200
        }
        return count
    }
}
