//
//  ContentView.swift
//  Hello Canvas 4
//
//  Created by Sruit Angkavanitsuk on 27/3/2567 BE.
//

import SwiftUI

var countBirdX = 0
var countBirdY = 100
var gameStart = false

// https://github.com/sruitasuk/learning_ios_graphics
struct ContentView: View {
    
    var iBird: Image
    var iBG: Image
    var iPigA : Image
    var iPigH : Image
    
    init() {
        iBird = Image("bird")
        iBG = Image("bg")
        iPigA = Image("pig-alive")
        iPigH = Image("pig-hurt")
    }
    
    var body: some View {
        TimelineView(.animation) { timelineContext in
            
            var birdX = updateUI()
            var isPigHurt = checkAttackOnPig()
            
            Canvas { context, size in
                context.draw(iBG, in: CGRect(x: 0, y: 0, width: 750, height: 375))
                context.draw(iBird, in: CGRect(x: birdX, y: countBirdY, width: 200, height: 200))
                if isPigHurt {
                    context.draw(iPigH, in: CGRect(x: 500, y: 100, width: 200, height: 200))
                }
                else {
                    context.draw(iPigA, in: CGRect(x: 500, y: 100, width: 200, height: 200))
                }
            }
        }.onTapGesture { location in
            if Int(location.x) > countBirdX &&
                Int(location.x) < countBirdX + 200 &&
                Int(location.y) > countBirdY &&
                Int(location.y) < countBirdY + 200  {
                gameStart = true
            }
        }
    }
    
    func updateUI() -> Int {
        if gameStart == true {
            countBirdX = countBirdX + 1
        }
        return countBirdX
    }
    
    func checkAttackOnPig() -> Bool {
        if countBirdX + 200 >= 500 {
            return true
        }
        return false
    }
}
