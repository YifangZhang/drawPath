//
//  ShapeView.swift
//  drawPath
//
//  Created by Yifang Zhang on 10/2/16.
//  Copyright © 2016 Yifang. All rights reserved.
//

import UIKit

class ShapeView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var currentShapeType: Int = 0
    
    init(frame: CGRect, shape: Int) {
        super.init(frame: frame)
        self.currentShapeType = shape
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        switch currentShapeType {
        case 0: drawLines()
        case 1: drawRectangle()
        case 2: drawCircle()
        default: print("default")
        }        
    }
    
    func drawLines() {
        //1 init the graphic setting
        let ctx = UIGraphicsGetCurrentContext()
        
        let PI = M_PI
        
        // 0 degree is downward, pi/2 is right on screen!
        let dataDict:[(distance: CGFloat, angle: CGFloat)] = [(distance: CGFloat(80.0), angle: CGFloat(PI/2.0)), (distance: 100.0, angle: CGFloat(0)), (distance: 50.0, angle: CGFloat(PI/2.0)), (distance: 70.0, angle: CGFloat(0))]
        
        //2 draw the path
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, 20.0, 20.0)
        
        var prev_x = CGFloat(20.0)
        var prev_y = CGFloat(20.0)
        
        for t in dataDict{
            CGContextAddLineToPoint(ctx, prev_x + t.distance*sin(t.angle), prev_y + t.distance*cos(t.angle))
            print((t.distance*sin(t.angle), t.distance*cos(t.angle)))
            prev_x = prev_x + t.distance*sin(t.angle)
            prev_y = prev_y + t.distance*cos(t.angle)
        }
        //CGContextAddLineToPoint(ctx, 100.0, 20.0)
        //CGContextAddLineToPoint(ctx, 100.0, 120.0)
        //CGContextAddLineToPoint(ctx, 150.0, 120.0)
        //CGContextAddLineToPoint(ctx, 150.0, 190.0)
        
        
        CGContextSetLineWidth(ctx, 5)
        
        //TODO: using the [x,y] = [d*sin(a), d*cos(a)] to determine the final distance
        
        //3 render the path
        //CGContextClosePath(ctx)
        CGContextStrokePath(ctx)
    }
    
    func drawRectangle() {
        let center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0)
        let rectangleWidth:CGFloat = 100.0
        let rectangleHeight:CGFloat = 100.0
        let ctx = UIGraphicsGetCurrentContext()
        
        //4
        CGContextAddRect(ctx, CGRectMake(center.x - (0.5 * rectangleWidth), center.y - (0.5 * rectangleHeight), rectangleWidth, rectangleHeight))
        CGContextSetLineWidth(ctx, 10)
        CGContextSetStrokeColorWithColor(ctx, UIColor.grayColor().CGColor)
        CGContextStrokePath(ctx)
        
        //5
        CGContextSetFillColorWithColor(ctx, UIColor.greenColor().CGColor)
        CGContextAddRect(ctx, CGRectMake(center.x - (0.5 * rectangleWidth), center.y - (0.5 * rectangleHeight), rectangleWidth, rectangleHeight))
        
        CGContextFillPath(ctx)
    }
    
    func drawCircle() {
        let center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0)
        let ctx = UIGraphicsGetCurrentContext()
        CGContextBeginPath(ctx)
        
        //6
        CGContextSetLineWidth(ctx, 5)
        
        let x:CGFloat = center.x
        let y:CGFloat = center.y
        let radius: CGFloat = 100.0
        let endAngle: CGFloat = CGFloat(2 * M_PI)
        
        CGContextAddArc(ctx, x, y, radius, 0, endAngle, 0)
        
        CGContextStrokePath(ctx)
    }

}
