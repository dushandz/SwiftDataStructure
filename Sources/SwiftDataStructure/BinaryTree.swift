//
//  BinaryTree.swift
//  
//
//  Created by dushandz on 2020/6/16.
//

import Foundation

// MARK: - BinaryTree

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    
    enum BinaryNodeTravelOrder {
        case Preorder,Inorder,Postorder
    }
    
    func travelInOrder(order:BinaryNodeTravelOrder visit: (BinaryNode) -> Void) {
        if order == .Postorder {
            visit(self)
        }
        
        self.leftChild?.travelInOrder(visit: visit)
        
        if order == .Inorder {
            visit(self)
        }
        
        self.rightChild?.travelInOrder(visit: visit)
        
        if order == .Preorder {
            visit(self)
        }
    }
}

// MARK: - BinarySearchTree
// lookup remove add opertaion O(log n)

public struct BinarySearchTree<Element: Comparable> {
    
    public private(set) var root: BinaryNode<Element>? // private(set)  readOlny
    public init() {
        
    }
}
