//
//  876. 链表的中间结点.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//

// https://leetcode-cn.com/problems/middle-of-the-linked-list/
import Foundation

class Solution1 {
    /// 使用数组搞定取中间节点
    /// - Parameter head: 头结点
    /// - Returns: 中间节点
    func middleNode(_ head: ListNode?) -> ListNode? {
        
        var node = head
        
        var index = 0
        var nodeList:[ListNode?] = []
        
        while node != nil {
            index += 1
            nodeList.append(node)
            node = node?.next
        }
        
        let centerIndex = index % 2 == 0 ? index / 2 : (index - 1) / 2
        
        return index == 0 ? node : nodeList[centerIndex]
    }
    
    /// 使用快慢指针搞定取中间节点
    /// - Parameter head: 头结点
    /// - Returns: 中间节点
    func middleNode1(_ head: ListNode?) -> ListNode? {
  
        var slow = head
        var fast = head?.next
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
}
