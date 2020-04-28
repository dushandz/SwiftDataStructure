//
//  Stack.swift
//  
//
//  Created by dushandz on 2020/4/23.
//

import Foundation

public struct Stack<Element> {
    private var storage: [Element] = []
    
    public init() {}
    public init(_ elements: [Element]) {
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
}
