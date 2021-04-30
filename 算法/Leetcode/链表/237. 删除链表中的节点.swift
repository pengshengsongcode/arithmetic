//
//  237. 删除链表中的节点.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//
// https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
import Foundation
class Solution5 {
    func deleteNode(_ node: ListNode?) {//思路为值替换
        var current = node
        while current != nil {
            if let next = current?.next {
                current?.val = next.val
            }
            if let _ = current?.next?.next {
            }else {
                current?.next = nil
            }
            current = current?.next
        }
    }
    
    /// 大佬思路不用循环
    func deleteNode1(_ node: ListNode?) {
        node?.val = node?.next?.val ?? 0
        node?.next = node?.next?.next
    }
}
