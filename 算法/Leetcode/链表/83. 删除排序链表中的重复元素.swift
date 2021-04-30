//
//  83. 删除排序链表中的重复元素.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//

// https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
import Foundation

class Solution7 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        let newHead: ListNode? = ListNode()
        newHead?.next = head
        var move = newHead?.next

        while var next = move?.next {

            if next.val == move?.val {
                
                var nnext: ListNode? = nil
                
                while let node = next.next {
                    if node.val != move?.val {
                        nnext = node
                        break
                    }
                    next = node
                }
                move?.next = nnext
            }else {
                move?.next = next
            }
            move = move?.next
        }
        return newHead?.next
    }
    /// 大佬思路：
    func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
        var node = head
        
        while node?.next != nil {
            if node?.val == node?.next?.val {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        
        return head
    }
    
}
