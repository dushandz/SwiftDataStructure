//
//  Stack.swift
//  
//
//  Created by dushandz on 2020/4/23.
//

import Foundation

public struct Stack<Element>: CustomStringConvertible, ExpressibleByArrayLiteral {
    
    public typealias ArrayLiteralElement = Element
    
    private var storage: [Element] = []
    
    public init() {}
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    }
    
    public var description: String {
        storage.reversed().map { "\($0)" }.joined(separator: "-")
    }
}


/// Challenge 1 Reverse Array
public extension Array {
    func reversePrint() {
        var stack = Stack<Element>()
        
        for i in self {
            stack.push(i)
        }
        
        while let v = stack.pop() {
            print(v)
        }
    }
}
