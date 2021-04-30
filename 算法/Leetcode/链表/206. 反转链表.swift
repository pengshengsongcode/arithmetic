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
    /// 大佬思路 - 递归
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        // last 永远是最后的一个
        let last: ListNode? = reverseList(head?.next)
//        print(last)
        // head 为 4 3 2 1
        //4.next.next -> 5.next = 4
        head?.next?.next = head
        //4.next = nil
        head?.next = nil
        return last
    }
    
}
