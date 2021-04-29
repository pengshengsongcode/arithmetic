//
//  203. 移除链表元素.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//
// https://leetcode-cn.com/problems/remove-linked-list-elements/
import Foundation

class Solution3 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        var nodeList: [ListNode?] = []
        
        var node = head
        
        while node != nil {
            
            if node?.val != val {
                nodeList.append(node)
            }
            node = node?.next
        }
        
        //1.2.3.4.5
        
        for (i, node) in nodeList.enumerated() {
            var next: ListNode? = nil
            if i != nodeList.count - 1 {
                next = nodeList[i + 1]
            }
            node?.next = next
        }
        
        return nodeList.first ?? nil
    }
    
    /// 大佬思路 在头结点之前再创建个头节点
    func removeElements1(_ head: ListNode?, _ val: Int) -> ListNode? {
            guard let h = head else {
                return nil
            }
            let top: ListNode = ListNode(val - 1)
            top.next = head
            var cur: ListNode? = top
            while let next = cur?.next {
                if next.val == val {
                    cur?.next = next.next
                } else {
                    cur = next
                }
            }
            return top.next
        }
    
}
