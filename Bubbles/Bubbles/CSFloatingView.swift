//
//  CSFloatingView.swift
//  Bubbles
//
//  Created by Admin on 4/12/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

@IBDesignable class CSFloatingView: UIView {
    
    public var floatingView = SKView()
    public var floatingCollectionScene : CSBubblesScene!
    
    @IBInspectable var primaryColor: UIColor = UIColor.red {didSet { }}
    @IBInspectable var secondaryColor: UIColor = UIColor.white {didSet { }}


    public var dataArray : NSMutableArray!{
        didSet {
            for newData in dataArray {
                let node = CSBubbleNode.instantiateWithTitle(title: newData as! String)
                node?.primaryColor = primaryColor
                node?.secondaryColor = secondaryColor
                self.floatingCollectionScene.addChild(node!)
            }

        }
       
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.floatingView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.addSubview(self.floatingView)
        
        self.floatingView.allowsTransparency = true
        self.floatingView.backgroundColor = UIColor.clear
        
        self.floatingCollectionScene = CSBubblesScene(size: self.floatingView.bounds.size)
        self.floatingView.presentScene(floatingCollectionScene)
    }

}
