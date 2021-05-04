//
//  main.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//

// 可视工具 - https://visualgo.net/zh

import Foundation

print("Hello, World!")

//动态数组_链表()
//链表的中间节点()
//环形链表()
//移除链表元素()
//反转链表()
//剑指删除链表的节点()
//删除排序链表中的重复元素()

动态数组_双向链表()

func 动态数组_链表() {
    let list = LinkedList<Int>()
    list.append(1)
    list.append(1)
    list.append(1)
    list.append(1)
    list.append(1)
    list.append(1)
    list.append(1)
    list.insert(at: 0, 2)
    list.remove(2)
    list.replace(at: 0, 2)

    print(list)
    print("根据索引查元素", list.element(of: 1))
    print("根据元素查索引", list.index(of: 2))

}

func 链表的中间节点() {
    
    // 1, 2, 3, 4, 5
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
//    let node5 = ListNode(5)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
//    node4.next = node5
    
    print(Solution1().middleNode(node1))
    print(Solution1().middleNode1(node1))
    
//    Solution1().middleNode(node1)
    
}

func 环形链表() {
    
    
    let node1 = ListNode(1)
//    node1.next = node1
//    node1.next = node1
//    node1.next = node1
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
//    node4.next = node2
    
    if Solution2().hasCycle(node1) {
        print("是环形链表")
    }else {
        print("不是环形链表")
    }
    
    if Solution2().hasCycle1(node1) {
        print("是环形链表")
    }else {
        print("不是环形链表")
    }
    
}


func 移除链表元素() {
//    // 1, 2, 3, 4
//    let node1 = ListNode(1)
//    let node2 = ListNode(2)
//    let node3 = ListNode(6)
//    let node4 = ListNode(3)
//    let node5 = ListNode(4)
//    let node6 = ListNode(5)
//    let node7 = ListNode(6)
//
//
//    node1.next = node2
//    node2.next = node3
//    node3.next = node4
//    node4.next = node5
//    node5.next = node6
//    node6.next = node7
    
    print(Solution3().removeElements(ListNode.create(intList: [7,7,7,7]), 7))
    
    
//    Solution1().middleNode(node1)
}

func 反转链表() {
    print(Solution4().reverseList2(ListNode.create(intList: [1,2,3,4,5])))
}

func 剑指删除链表的节点() {
    print(Solution6().deleteNode1(ListNode.create(intList: [1,1,1,1,1,1,1,1,2]), 1))
}


func 删除排序链表中的重复元素() {
//    print(Solution7().deleteNode(ListNode.create(intList: [4, 5, 1, 9]), 5))
    print(Solution7().deleteDuplicates(ListNode.create(intList: [-1,0,0,0,0,3,3])))
}

func 动态数组_双向链表() {
    let list = LinkedList1<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    list.append(4)
    list.append(5)
    list.append(6)
    list.append(7)
    
    print(list)
    
    list.insert(at: 0, 8)
    print(list)
    list.remove(2)
    
    list.replace(at: 0, 9)
    list.remove(at: 0)
    // 1、3、4、5、6、7
    print(list)
    list.remove(at: list.size() - 1)
    //期望：9、1、3、4、5、6、7
    //实际：9、1、nil、3、4、5、7
    print(list)
    print("根据索引查元素", list.element(of: 1))
    print("根据元素查索引", list.index(of: 2))
    
    list.clear()
    print(list)
}
