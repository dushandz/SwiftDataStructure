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
    
    public var size: Int { storage.count }
    
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

//MARK: - LeetCode

///LeetCode:
public extension Stack where Element == String.Element {
    static func expample() {
        let param = "({})([])(())"
        let size = [4, 2, 5, 3]
        let dir = [1 ,1 ,0 ,0]
        print(checkStrValid3(param))
    }
    
    
    static private func checkStrValid(_ param: String) -> Bool {
        
        guard param.count != 0,
              param.count % 2 == 0
        else { return false }
        
        var container = Stack()
        for item in param {
            if item == "(" {
                container.push(item)
            } else {
                if container.isEmpty {
                    return false
                } else {
                    container.pop()
                }
            }
        }
        return  container.isEmpty
    }
    
    static private func checkStrValid2(_ param: String) -> Bool {
        
        guard param.count != 0,
              param.count % 2 == 0
        else { return false }
        var leftCount = 0
        var rightCount = 0
        for item in param {
            item == "(" ? (leftCount += 1) : (rightCount += 1)
        }
        return leftCount == rightCount
    }
    
    
    static private func checkStrValid3(_ param: String) -> Bool {
        
        guard param.count != 0,
              param.count % 2 == 0
        else { return false }
        var t = Stack()
        for item in param  {
            if item == "{" || item == "[" || item == "(" {
                t.push(item)
            } else if item == "}" {
                if t.isEmpty || t.peek() != "{" {
                    return false
                } else {
                    t.pop()
                }
            } else if item == "]" {
                if t.isEmpty || t.peek() != "[" {
                    return false
                } else {
                    t.pop()
                }
            } else if item == ")" {
                if t.isEmpty || t.peek() != "(" {
                    return false
                } else {
                    t.pop()
                }
            }
        }
        return t.isEmpty
    }
    

}

public extension Stack where Element == Int {
    
    static func expample() {
        let size = [4, 2, 5, 3]
        let dir = [1 ,1 ,0 ,0]
    }
    
    static private func fishGame(_ size: [Int], dir: [Int]) -> Int {
        if size.count <= 1  { return size.count }
        var t = Stack()
        let left = 0
        let right = 1
        for i in 0..<size.count {
            let curDir = dir[i]
            let curSize = size[i]
            var hasEat = false
            
            while !t.isEmpty && dir[t.peek()!] == right && curDir == left {
                if size[t.peek()!] > curSize {
                    hasEat = true
                    break;
                }
                t.pop()
            }
            if (hasEat == false) {
                t.push(i)
            }
        }
        return t.size
    }
}
