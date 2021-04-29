//
//  141. 环形链表.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//
// https://leetcode-cn.com/problems/linked-list-cycle/
import Foundation

class Solution2 {
    /// 非环形链表时 此方法更优
    func hasCycle(_ head: ListNode?) -> Bool {
        
        var slow = head
        var fast = head?.next
        while fast != nil {
            if slow === fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return false
        
    }
    /// 大佬思路为 nil == nil 且 有值时相等 故需要等slow 遍历到尾或者fast追上slow O(n)
    func hasCycle1(_ head: ListNode?) -> Bool {
        
        var slow = head, fast = head?.next
        while fast !== slow {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow != nil
        
    }
}
