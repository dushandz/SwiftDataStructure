//
//  LinkedList.swift
//  
//
//  Created by dushandz on 2020/4/15.
//

//MARK: - Node

public class Node<T> {
    public var value:T
    public var next: Node?
    public init(_ value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
         guard let next = next else {
             return "\(value)"
         }
         return "\(value) ->" + String(describing: next) + " "
     }
}

//MARK: - LinkedList

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    public var isEmpty: Bool {
        return head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

extension LinkedList {
    ///head insert
    public mutating func push(_ value: Value) {
        head = Node(value, next: head)
        if tail == nil {
            tail = head
        }
    }
    ///tail insert
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value)
        tail = tail!.next
    }
    
    
    public func node(at index: Int)  -> Node<Value>? {
        var currentNode = index < 0 ? nil : head
        var currentIndex = 0
        while currentNode != nil && currentIndex < index {
            currentNode = head?.next
            currentIndex = currentIndex + 1
        }
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node:Node<Value>) -> Node<Value> {
        // is tail is equal to node in reference.
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value, next: node.next)
        return node.next!
    }
    

    
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    public mutating func removeLast() -> Value? {
        // use guard statment can declare an Node type. you can use in function.
        guard let head = head else {
            return nil
        }
        // 是否是特殊情况 只有一个
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
        
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Value? {
        if index < 0 {
            return nil
        }
        
        if index == 0 {
            let value = head?.value
            head = head?.next
            return value
        }
        let preNode = node(at: index - 1)
        let findNode = node(at: index)
        preNode?.next = findNode?.next
        return findNode?.value
    }
}



