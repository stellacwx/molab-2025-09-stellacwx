import UIKit

// following render fill example

let size = CGSize(width: 1024, height: 1024)
let renderer = UIGraphicsImageRenderer(size: size)

let image = renderer.image { context in
    
    // base colors
    // sky
    UIColor.systemPink.setFill()
    context.fill(CGRect(x: 0, y: 0, width: 1024, height: 100))
    UIColor.red.setFill()
    context.fill(CGRect(x: 0, y: 100, width: 1024, height: 100))
    UIColor.systemRed.setFill()
    context.fill(CGRect(x: 0, y: 200, width: 1024, height: 200))
    UIColor.systemOrange.setFill()
    context.fill(CGRect(x: 0, y: 400, width: 1024, height: 200))
    UIColor.systemYellow.setFill()
    context.fill(CGRect(x: 0, y: 600, width: 1024, height: 200))
    // ocean
    UIColor.systemBlue.setFill()
    context.fill(CGRect(x: 0, y: 682, width: 1024, height: 342))
    
    // sky blending
    // fills two blocks with two in between
    func blendTwo(color: UIColor, x: Int, y: Int) {
        var xc = x
        while xc < 1023 {
            color.setFill()
            context.fill(CGRect(x: xc, y: y, width: 2, height: 3))
            xc += 4
        }
    }
    // fills one block with two in between
    func blendOne(color: UIColor, x: Int, y: Int) {
        var xc = x
        while xc < 1023 {
            color.setFill()
            context.fill(CGRect(x: xc, y: y, width: 1, height: 3))
            xc += 3
        }
    }
    
    blendTwo(color: .systemPink, x: 0, y: 100)
    blendTwo(color: .systemPink, x: 2, y: 103)
    blendTwo(color: .systemPink, x: 0, y: 106)
    blendTwo(color: .systemPink, x: 2, y: 109)
    blendOne(color: .systemPink, x: 0, y: 112)

    blendTwo(color: .red, x: 0, y: 200)
    blendTwo(color: .red, x: 2, y: 203)
    blendTwo(color: .red, x: 0, y: 206)
    blendTwo(color: .red, x: 2, y: 209)
    blendOne(color: .red, x: 0, y: 212)
    
    blendTwo(color: .systemRed, x: 0, y: 400)
    blendTwo(color: .systemRed, x: 2, y: 403)
    blendTwo(color: .systemRed, x: 0, y: 406)
    blendTwo(color: .systemRed, x: 2, y: 409)
    blendOne(color: .systemRed, x: 0, y: 412)
    
    blendTwo(color: .systemOrange, x: 0, y: 600)
    blendTwo(color: .systemOrange, x: 2, y: 603)
    blendTwo(color: .systemOrange, x: 0, y: 606)
    blendTwo(color: .systemOrange, x: 2, y: 609)
    blendOne(color: .systemOrange, x: 0, y: 612)
    
    // sun
    // 50 width on each side
    UIColor.yellow.setFill()
    context.fill(CGRect(x: 334, y: 504, width: 356, height: 178))
    UIColor.white.setFill()
    context.fill(CGRect(x: 384, y: 554, width: 256, height: 128))
    
    // water reflections
    UIColor.systemCyan.setFill()
    func reflections(_ count: Int) {
        for _ in 0..<count {
            context.fill(CGRect(x: Int.random(in: 1...1014), y: Int.random(in: 682...1024), width: 20, height: 6))
        }
    }
    reflections(150)
    
    // ocean details
    // outer reflection
    var xc = 284
    var yc = 682
    var width = 456
    var height = 5
    UIColor.white.setFill()
    while (xc < 500) {
        context.fill(CGRect(x: xc, y: yc, width: width, height: height))
        var factor = Int.random(in: 1...5)
        xc += factor
        yc += Int.random(in: 5...13)
        width -= factor * 2
        height = Int.random(in: 3...9)
    }
    // inner reflection
    xc = 354
    yc = 682
    width = 316
    height = 15
    UIColor.white.setFill()
    while (xc < 500) {
        context.fill(CGRect(x: xc, y: yc, width: width, height: height))
        var factor = Int.random(in: 3...9)
        xc += factor
        yc += Int.random(in: 7...15)
        width -= factor * 2
    }

}
image
