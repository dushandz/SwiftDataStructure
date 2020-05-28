//
//  Queue.swift
//  
//
//  Created by dushandz on 2020/4/23.
//

//First In First Out

struct Queue<Element> {
    private var storage: [Element] = [Element]()
    
    var isEmpty: Bool {
        self.storage.count > 0
    }
    
    var peek: Element? {
        self.isEmpty ? nil : self.storage.first
    }
    
    mutating public func enqueue(_ element: Element) {
        self.storage.append(element)
        
    }
    
    mutating public func dequeue() -> Element? {
        self.isEmpty ? nil : self.storage.popLast()
    }
}
