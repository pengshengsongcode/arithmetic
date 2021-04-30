//
//  剑指 Offer 18. 删除链表的节点.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//
// https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof/
import Foundation

class Solution6 {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        // 创建一个新的首节点，然后遍历首节点后面的所有元素，如果和val一致的话，
        
        let newHead = ListNode.init()
        newHead.next = head
        
        var move: ListNode? = newHead
        
        while let next = move?.next {
            
            if next.val == val {
                move?.next = next.next
            }else{
                move?.next = next
            }
            move = move?.next
        }
        
        return newHead.next
        
    }
}
