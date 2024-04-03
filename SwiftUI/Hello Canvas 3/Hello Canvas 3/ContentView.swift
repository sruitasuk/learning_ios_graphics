//
//  ContentView.swift
//  Hello Canvas 3
//
//  Created by Sruit Angkavanitsuk on 27/3/2567 BE.
//

import SwiftUI

var countX = 0
var countY = 100
var gameStart = false

struct ContentView: View {
    
    var iBird: Image
    var iBG: Image
    
    init() {
        iBird = Image("bird")
        iBG = Image("bg")
    }
    
    var body: some View {
        TimelineView(.animation) { timelineContext in
            
            var birdX = updateUI()
            
            Canvas { context, size in
                context.draw(iBG, in: CGRect(x: 0, y: 0, width: 750, height: 375))
                context.draw(iBird, in: CGRect(x: birdX, y: countY, width: 200, height: 200))
            }
        }.onTapGesture { location in
            if Int(location.x) > countX &&
                Int(location.x) < countX + 200 &&
                Int(location.y) > countY &&
                Int(location.y) < countY + 200  {
                gameStart = true
            }
        }
    }
    
    func updateUI() -> Int {
        if gameStart == true {
            countX = countX + 1
        }
        return countX
    }
    
}
