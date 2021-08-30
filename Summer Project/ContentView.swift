//
//  ContentView.swift
//  Summer Project
//
//  Created by Kendall Easterly.
//

import SwiftUI

struct ContentView: View {
    
    @State var lights: [[Bool]]
    @State var didFinish = false
    
    init() {
        var newLights = [[Bool]]()
        
        for _ in 0..<5 {
            
            var newLightsRow = [Bool]()
            
            for _ in 0..<5 {
                
                let numericalState = Int.random(in: 0..<2)
                let state = numericalState == 1
                
                newLightsRow.append(state)
                
            }
            
            newLights.append(newLightsRow)
        }
        
        
        self.lights = newLights
    }
    
    var body: some View {
        
        VStack {
            
            Text(didFinish ? "Congratulations! You finished!" : "")
            
            ForEach(0..<5) { YPos in
                HStack {
                    ForEach(0..<5) { XPos in
                        
                        LightSubView(lights: $lights, xPos: YPos, yPos: XPos)
                    }
                }
            }
        }.onChange(of: lights) { newValue in
            
            checkForFinish()
            
        }
    }
}

extension ContentView {
    
    func checkForFinish() {
        
        var remainingLights = 0
        
        for row in lights {
            
            for light in row {
                if light {remainingLights += 1}
            }
        }
        
        if remainingLights == 0 {
            didFinish = true
        } else {
            didFinish = false
        }
    }
}
