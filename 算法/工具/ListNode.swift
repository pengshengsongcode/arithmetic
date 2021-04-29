//
//  ListNode.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//

import Foundation

/// Leetcode 源码
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
 }

extension ListNode {
    static func create(intList: [Int]) -> ListNode? {
        
        var nodeList = [ListNode?]()
        
        for i in intList {
            nodeList.append(ListNode.init(i))
        }
        
        for (i, node) in nodeList.enumerated() {
            var next: ListNode? = nil
            if i != nodeList.count - 1 {
                next = nodeList[i + 1]
            }
            node?.next = next
        }
        return nodeList.first ?? nil
    }
}

extension ListNode: CustomStringConvertible {
    
    public var description:String {
        
        var node: ListNode? = self
        
        var index: Double = 0
        var stringList:[Int?] = []
        
        while node != nil {
            
            stringList.append(node?.val)
            index += 1
            node = node!.next
        }
        
//        return string
//        guard let arr = arrayList else { return "" }
        return "size: \(index), elements:[\(stringList.enumerated())]"
    }
}
