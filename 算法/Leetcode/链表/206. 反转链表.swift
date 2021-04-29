//
//  206. 反转链表.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//
// https://leetcode-cn.com/problems/reverse-linked-list/
import Foundation

class Solution4 {
    /// 思路一 - 数组
    func reverseList(_ head: ListNode?) -> ListNode? {
  
        var nodeList: [ListNode?] = [head]
        
        var currentNode: ListNode? = head
        
        while currentNode != nil {
            nodeList.append(currentNode)
            currentNode = currentNode?.next
        }
        
        for i in (0...nodeList.count - 1).reversed() {
            
            if i == 0 {
                nodeList[i]?.next = nil
            }else {
                nodeList[i]?.next = nodeList[i - 1]
            }
            
        }
        return nodeList.last ?? nil
    }
    
    /// 思路二 - tmp
    func reverseList1(_ head: ListNode?) -> ListNode? {

        var newHead: ListNode? = nil
        var tmp: ListNode? = head
        var oldHead: ListNode? = head
        
        while tmp != nil {
            
            tmp = oldHead?.next
            oldHead?.next = newHead
            newHead = oldHead
            oldHead = tmp
        }
        
        return newHead
    }
}
