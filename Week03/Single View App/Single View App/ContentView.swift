//
//  ContentView.swift
//  Single View App
//
//  Created by Stella Wang on 9/25/25.
//

import SwiftUI

// random dot art

let animInterval = 0.10; // update very tenth of a second
let colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple];

struct DotData {
    var path: Path
    var color: Color
}

var dots: [DotData] = []

struct ContentView: View {
    var body: some View {
        TimelineView(.animation(minimumInterval: animInterval)) { timeline in
            Canvas { context, size in
                // create a dot
                let radius = CGFloat.random(in: 20...60)
                let x = CGFloat.random(in: 0...size.width - radius * 2)
                let y = CGFloat.random(in: 0...size.height - radius * 2)
                let rect = CGRect(x: x, y: y, width: radius * 2, height: radius * 2)
                let color = colors.randomElement() ?? .black
                
                var p = Path()
                p.addEllipse(in: rect)
                
                // add dot to dots array
                dots.append(DotData(path: p, color: color))
                
                // draw all the dots
                for d in dots {
                    let shading = GraphicsContext.Shading.color(d.color)
                    context.fill(d.path, with: shading)
                }
                
                // reset
                if dots.count > 100 { dots = [] }
                
                // must read to trigger update
                _ = timeline.date
            }
        }
    }
}

#Preview {
    ContentView()
}
