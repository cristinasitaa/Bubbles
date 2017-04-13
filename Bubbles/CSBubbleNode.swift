//
//  BubbleNode.swift
//  Bubbles
//
//  Created by Admin on 4/11/17.
//  Copyright © 2017 Admin. All rights reserved.
//
import Foundation

import UIKit
import SpriteKit

//import CSFloatingCollection

open class CSBubbleNode: CSFloatingNode {
    var labelNode = SKLabelNode(fontNamed: "Arial")
    var messageNode = SKLabelNode(fontNamed: "Arial")
    var message : String!
    var primaryColor : SKColor! {
        didSet {
            updatePrimaryColor()
        }
    }
    var secondaryColor : SKColor! {
        didSet {
            updateSecondaryColor()
        }
    }
    
    class func instantiateWithTitle(title: String) -> CSBubbleNode! {
        let node = CSBubbleNode(circleOfRadius: 30)
        configureNodeWithTitle(node,title: title)
        return node
    }
    
    class func configureNodeWithTitle(_ node: CSBubbleNode!, title: String) {
        let boundingBox = node.path?.boundingBox;
        let radius = (boundingBox?.size.width)! / 2.0;
        node.physicsBody = SKPhysicsBody(circleOfRadius: radius + 1.5)
        node.message = title
    }
    
    func updatePrimaryColor(){
        self.labelNode.fontColor = self.primaryColor
        self.messageNode.fontColor = self.primaryColor

        self.labelNode.text = self.message

        self.labelNode.position = CGPoint.zero
        self.labelNode.fontColor = self.primaryColor
        self.labelNode.fontSize = 10
        
        self.labelNode.isUserInteractionEnabled = false
        self.labelNode.verticalAlignmentMode = .center
        self.labelNode.horizontalAlignmentMode = .center
        
        
        self.messageNode = self.labelNode.multilined()
        self.messageNode.position = CGPoint.zero //CGPoint(x: frame.midX, y: frame.midY)
        self.messageNode.zPosition = 1001  // On top of all other nodes
        
        self.labelNode = self.messageNode
        
        self.addChild(self.messageNode)

    }
    
    func updateSecondaryColor() {
        self.fillColor = self.secondaryColor
        self.strokeColor = self.secondaryColor
    }

    
    override open func selectingAnimation() -> SKAction? {
        removeAction(forKey: CSBubbleNode.removingKey)
    
        for children in self.messageNode.children {
            if children.name == "innerLabel" {
                let childNodeLabel = children as! SKLabelNode
                childNodeLabel.fontColor = secondaryColor
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BubbleWasSelected"), object: childNodeLabel.text)
            }
        }

        self.fillColor = self.primaryColor
        self.strokeColor = self.primaryColor

        return SKAction.scale(to: 2, duration: 0.2)
    }
    
    override open func normalizeAnimation() -> SKAction? {
        removeAction(forKey: CSBubbleNode.removingKey)
        for children in self.messageNode.children {
            if children.name == "innerLabel" {
                let childNodeLabel = children as! SKLabelNode
                childNodeLabel.fontColor = self.primaryColor
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BubbleWasDeselected"), object: childNodeLabel.text)
            }
        }

        self.fillColor = secondaryColor
        self.strokeColor = secondaryColor
        
        return SKAction.scale(to: 1, duration: 0.2)
    }
    
    override open func removeAnimation() -> SKAction? {
        removeAction(forKey: CSBubbleNode.removingKey)
        return SKAction.fadeOut(withDuration: 0.2)
    }
    
    override open func removingAnimation() -> SKAction {
        let pulseUp = SKAction.scale(to: xScale + 0.13, duration: 0)
        let pulseDown = SKAction.scale(to: xScale, duration: 0.3)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        return repeatPulse
    }
}
