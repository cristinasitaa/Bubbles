//
//  CSFloatingNode.swift
//  Bubbles
//
//  Created by Admin on 4/11/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import SpriteKit

public enum CSFloatingNodeState {
    case normal
    case selected
    case removing
}

open class CSFloatingNode: SKShapeNode {
    fileprivate(set) var previousState: CSFloatingNodeState = .normal
    fileprivate var _state: CSFloatingNodeState = .normal
    open var state: CSFloatingNodeState {
        get {
            return _state
        }
        set {
            if _state != newValue {
                previousState = _state
                _state = newValue
                stateChaged()
            }
        }
    }
    
    open static let removingKey = "action.removing"
    open static let selectingKey = "action.selecting"
    open static let normalizeKey = "action.normalize"
    
    fileprivate func stateChaged() {
        var action: SKAction?
        var actionKey: String?
        
        switch state {
        case .normal:
            action = normalizeAnimation()
            actionKey = CSFloatingNode.normalizeKey
        case .selected:
            action = selectingAnimation()
            actionKey = CSFloatingNode.selectingKey
        case .removing:
            action = removingAnimation()
            actionKey = CSFloatingNode.removingKey
        }
        
        if let a = action, let ak = actionKey {
            run(a, withKey: ak)
        }
    }
    
    override open func removeFromParent() {
        if let action = removeAnimation() {
            run(action, completion: { () -> Void in
                super.removeFromParent()
            })
        } else {
            super.removeFromParent()
        }
    }
    
    // MARK: -
    // MARK: Animations
    open func selectingAnimation() -> SKAction? {return nil}
    open func normalizeAnimation() -> SKAction? {return nil}
    open func removeAnimation() -> SKAction? {return nil}
    open func removingAnimation() -> SKAction? {return nil}
}
