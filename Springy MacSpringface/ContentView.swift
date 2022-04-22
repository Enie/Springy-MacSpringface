//
//  ContentView.swift
//  Springy MacSpringface
//
//  Created by Enie Weiß on 23.04.22.
//

import SwiftUI

struct ContentView: View {
    @State var mass: CGFloat = 1
    @State var damping: CGFloat = 0.5
    @State var stiffness: CGFloat = 0.5
    @State var initialVelocity: CGFloat = 0
    // these should not be needed
    @State var bouncinessScale: CGFloat = 0.1
    @State var velocityScale: CGFloat = 10.0
    @State var frequencyScale: CGFloat = 1.5
    
    let size = 400.0
    
    var body: some View {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
                
        return VStack {
            ZStack {
                DampedHarmonicOscillatorView(mass: 1,
                                            damping: 1,
                                            stiffness: 1,
                                            initialVelocity: 0,
                                            color: .yellow,
                                            unknownBouncinessScale: bouncinessScale,
                                            unknownFrequencyScale: frequencyScale,
                                            unknownVelocityScale: velocityScale)
                    .frame(width: size, height: size)
                DampedHarmonicOscillatorView(mass: 1,
                                            damping: 1,
                                            stiffness: 1,
                                            initialVelocity: 0,
                                            color: .red,
                                            unknownBouncinessScale: bouncinessScale,
                                            unknownFrequencyScale: frequencyScale,
                                            unknownVelocityScale: velocityScale)
                    .frame(width: size, height: size)
                DampedHarmonicOscillatorView(mass: 1,
                                            damping: 1,
                                            stiffness: 5,
                                            initialVelocity: 0,
                                            color: .purple,
                                            unknownBouncinessScale: bouncinessScale,
                                            unknownFrequencyScale: frequencyScale,
                                            unknownVelocityScale: velocityScale)
                    .frame(width: size, height: size)
                DampedHarmonicOscillatorView(mass: 1,
                                            damping: 2,
                                            stiffness: 1,
                                            initialVelocity: 0,
                                            color: .green,
                                            unknownBouncinessScale: bouncinessScale,
                                            unknownFrequencyScale: frequencyScale,
                                            unknownVelocityScale: velocityScale)
                    .frame(width: size, height: size)
                DampedHarmonicOscillatorView(mass: 1,
                                            damping: 1,
                                            stiffness: 1,
                                            initialVelocity: 2,
                                            color: .blue,
                                            unknownBouncinessScale: bouncinessScale,
                                            unknownFrequencyScale: frequencyScale,
                                            unknownVelocityScale: velocityScale)
                    .frame(width: size, height: size)
                DampedHarmonicOscillatorView(mass: mass, damping:
                                                damping, stiffness:
                                                stiffness, initialVelocity:
                                                initialVelocity, color: .cyan, unknownBouncinessScale:
                                                bouncinessScale, unknownFrequencyScale: frequencyScale,
                                            unknownVelocityScale: velocityScale)
                    .frame(width: size, height: size)
                    .border(.secondary, width: 2)
            }
            HStack {
                Text("damping")
                Slider(value: $damping, in: 0...2)
                Text(formatter.string(from:NSNumber(value:damping))!)
            }
            HStack {
                Text("stiffness")
                Slider(value: $stiffness, in: 1...10)
                Text(formatter.string(from:NSNumber(value:stiffness))!)
            }
            HStack {
                Text("mass")
                Slider(value: $mass, in: 0.1...10)
                Text(formatter.string(from:NSNumber(value:mass))!)
            }
            HStack {
                Text("initial velocity")
                Slider(value: $initialVelocity, in: 0...2)
                Text(formatter.string(from:NSNumber(value:initialVelocity))!)
            }
            Text("unknown parameters")
                .font(.subheadline)
            HStack {
                Text("bounciness scale")
                Slider(value: $bouncinessScale, in: 0.01...1)
                Text(formatter.string(from:NSNumber(value:bouncinessScale))!)
            }
            HStack {
                Text("initial velocity scale")
                Slider(value: $velocityScale, in: 0...20)
                Text(formatter.string(from:NSNumber(value:velocityScale))!)
            }
            HStack {
                Text("frequency scale")
                Slider(value: $frequencyScale, in: 0...10)
                Text(formatter.string(from:NSNumber(value:frequencyScale))!)
            }
        }.padding(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
