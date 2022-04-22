//
//  DampedHarmonicOscillatorView.swift
//  Springy MacSpringface
//
//  Created by Enie Weiß on 23.04.22.
//

import SwiftUI

struct DampedHarmonicOscillatorView: View {
    var resolution: CGFloat = 100
    
    var mass: CGFloat
    var damping: CGFloat
    var stiffness: CGFloat
    var initialVelocity: CGFloat
    var color: Color = .purple
    
    var unknownBouncinessScale: CGFloat = 0.1
    var unknownFrequencyScale: CGFloat = 1.5
    var unknownVelocityScale: CGFloat = 10.0
    
    // an array with points between [0,0] and [1,1]
    var points: [CGPoint] {
        var newPoints = Array<CGPoint>(repeating: .zero, count: Int(resolution))
        
        var velocity = initialVelocity/resolution*unknownVelocityScale // initial spring force
        var lastY: CGFloat = 0
        var dampingForce: CGFloat = 0

        for i in 0..<Int(resolution) {
            let t = CGFloat(i)
            let displacement = (1 - lastY) // displacement
            let springForce = (stiffness/mass * displacement) // this should actually be negative :/ (-k/m * x)

            velocity += springForce/resolution*unknownFrequencyScale - dampingForce/resolution/unknownBouncinessScale
            
            let y = lastY + velocity
            newPoints[i] = CGPoint(x: t/resolution, y: y )
            let derivativeOfY = (1 - lastY) - (1 - y)
            dampingForce = (damping/mass * derivativeOfY)
            lastY = y
        }

        return newPoints
    }

    var body: some View {
        GeometryReader {geo in
            Path { path in
                let width: CGFloat = geo.size.width
                let height = width
                
                path.move(to: CGPoint(x:0,y:height))
                points.forEach { point in
                    path.addLine(to: CGPoint(x: point.x*width, y: height - point.y*height*0.5))
                }
            }
            .stroke(color, lineWidth: 2)
        }
    }
}

struct DampedHarmonicOscillatorView_Previews: PreviewProvider {
    static var previews: some View {
        DampedHarmonicOscillatorView(mass: 1, damping: 1, stiffness: 2, initialVelocity: 0)
    }
}
