//
//  main.swift
//  算法
//
//  Created by pengshengsong on 2021/4/28.
//

// 可视工具 - https://visualgo.net/zh

import Foundation

print("Hello, World!")

动态数组_链表()

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

