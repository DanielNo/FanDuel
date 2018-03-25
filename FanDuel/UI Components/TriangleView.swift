//
//  TriangleView.swift
//  ScratchProject
//
//  Created by Daniel No on 3/22/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit

public enum ViewShape {
    case rightTriangle
    case leftTriangle
    case box
}

class TriangleView : UIView {
    var shape : ViewShape! {
        willSet{
            switch newValue {
            case .leftTriangle:
                self.drawLeftShape(self.frame)
            case .rightTriangle:
                self.drawRightShape(self.frame)
            case .box:
                self.drawBox(self.frame)
            default:
                print("")
            }
            
        }
    }
    
    var fillColor : UIColor = UIColor.white
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.shape = ViewShape.box
    }
    
    public convenience init(frame: CGRect, shape : ViewShape) {
        self.init(frame: frame)
        self.shape = shape
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.shape = ViewShape.box
    }
    
    override func draw(_ rect: CGRect) {
        switch self.shape {
        case .leftTriangle:
            self.drawLeftShape(rect)
        case .rightTriangle:
            self.drawRightShape(rect)
        case .box:
            self.drawBox(rect)
        default:
            print("invalid")
        }
    }
    
    
    
    func drawLeftShape(_ rect: CGRect){
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.beginPath()
        context.move(to: CGPoint(x: rect.maxX/8, y:rect.minY ))
        context.addLine(to: CGPoint(x: rect.maxX/8, y:rect.maxY/3 ))
        context.addLine(to: CGPoint(x: rect.minX, y:rect.maxY/2))
        context.addLine(to: CGPoint(x: rect.maxX/8, y:rect.maxY/3 * 2))
        context.addLine(to: CGPoint(x: rect.maxX/8, y:rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX/8 * 7, y:rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX/8 * 7, y:rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX/3, y:rect.minY ))
        context.closePath()
        context.setFillColor(self.fillColor.cgColor)
        context.fillPath()

    }
    
    func drawRightShape(_ rect: CGRect){
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.beginPath()
        context.move(to: CGPoint(x: rect.maxX/8, y:rect.minY ))
        context.addLine(to: CGPoint(x: rect.maxX/8 * 7, y:rect.minY ))
        context.addLine(to: CGPoint(x: rect.maxX/8 * 7, y:rect.maxY/3 ))
        context.addLine(to: CGPoint(x: rect.maxX, y:rect.maxY/2))
        context.addLine(to: CGPoint(x: rect.maxX/8 * 7, y:rect.maxY/3 * 2))
        context.addLine(to: CGPoint(x: rect.maxX/8 * 7, y:rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX/8, y:rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX/8, y:rect.minY ))
        context.closePath()
        context.setFillColor(self.fillColor.cgColor)
        context.fillPath()

    }
    
    func drawBox(_ rect: CGRect){
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.beginPath()
        context.move(to: CGPoint(x: rect.maxX/8, y:rect.minY ))
        context.addLine(to: CGPoint(x: rect.maxX/8, y:rect.maxY ))
        context.addLine(to: CGPoint(x: rect.maxX/8 * 7, y:rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX/8 * 7, y:rect.minY))
        context.move(to: CGPoint(x: rect.maxX/8, y:rect.minY ))
        context.closePath()
        context.setFillColor(self.fillColor.cgColor)
        context.fillPath()
    }
    
}

