//
//  LightSubView.swift
//  LightSubView
//
//  Created by Kendall Easterly.
//

import SwiftUI

struct LightSubView: View {
    
    @Binding var lights: [[Bool]]
    var xPos: Int
    var yPos: Int
    
    
    var body: some View {
        Button {
            toggleSelf()
        } label: {
            Circle()
                .foregroundColor(lights[yPos][xPos] ? Color.yellow : Color.gray)
                .frame(width: 30, height: 30)
                .padding()
        }
    }
}

extension LightSubView {
    
    func toggleSelf() {
        
        toggleLight(yPos: yPos, xPos: xPos)
        
        toggleLight(yPos: yPos + 1, xPos: xPos)
        
        toggleLight(yPos: yPos - 1, xPos: xPos)
        
        toggleLight(yPos: yPos, xPos: xPos + 1)
        
        toggleLight(yPos: yPos, xPos: xPos - 1)
        
        
    }
    
    func toggleLight(yPos: Int, xPos: Int) {
        
        
        if canToggleLight(yPos: yPos, xPos: xPos) {
            let originalValue = lights[yPos][xPos]
            lights[yPos][xPos] = !originalValue
        }
    }
    
    func canToggleLight(yPos: Int, xPos: Int ) -> Bool {
        
        let acceptableRange = 0..<5
        
        return acceptableRange.contains(xPos) && acceptableRange.contains(yPos)
        
    }
    
    
//    MARK: "Check Expects"
    
//    canToggleLight(yPos: 0, xPos: 0)
//    returns true
//
//    canToggleLight(yPos: -1, xPos: 0)
//    returns false
//
//    canToggleLight(yPos: 0, xPos: 5)
//    returns false
    
}
