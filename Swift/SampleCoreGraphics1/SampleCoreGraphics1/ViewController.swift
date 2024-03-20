//
//  ViewController.swift
//  SampleCoreGraphics1
//
//  Created by Sruit Angkavanitsuk on 14/3/2566 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var canvas: CanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.canvas.updateUI()
        DispatchQueue.global().async {
            while (self.canvas.xD > 0) {
                DispatchQueue.main.async {
                    self.canvas.updateUI()
                }
                print("tick")
                usleep(30 * 1000)
            }
        }
    }
}

class CanvasView: UIView {
    
    var xD = 300
    var yD = 50
    
    var iBg:UIImage!
    var iBird:UIImage!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var iBgRaw = UIImage(named: "bg.jpg")!
        var iBirdRaw = UIImage(named: "bird.png")!
        
        // flip image
        iBg = iBgRaw.rotate(radians: .pi)
        iBird = iBirdRaw.rotate(radians: .pi)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        context.draw(iBg.cgImage!, in: CGRect(x: 0,y: 0,width: 768,height: 322))
        context.draw(iBird.cgImage!, in: CGRect(x: xD,y: yD,width: 200,height: 200))
        
        // sample draw line
        /*
        //context.lineWidth = 2
        context.move(to: CGPoint(x: self.xD, y: self.yD))
        context.addLine(to: CGPoint(x: self.xD + 30, y: self.yD+100))
        UIColor.red.setStroke()
        context.strokePath()
        */
    }
    
    func updateUI() {
        
        // move bird from right to left
        self.xD -= 2
        
        // update UI
        setNeedsDisplay()
    }
    
}
