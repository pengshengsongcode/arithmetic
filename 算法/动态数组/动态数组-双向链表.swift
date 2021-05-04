//
//  动态数组-双向链表.swift
//  算法
//
//  Created by 彭盛凇 on 2021/5/2.
//

import Foundation

class LinkedList1<Element: Equatable> {
    
    /// Leetcode 源码
    public class Node {
        public var val: Element?
        public var next: Node?
        public var pre: Node?
        public init(_ val: Element?, pre: Node? = nil, next: Node? = nil) {
            self.val = val
            self.next = next
            self.pre = pre
        }
        deinit {
            print("\(self.val)nil")
        }
    }
    
    /// 默认越界索引
    fileprivate let nomarlOffRange = -1
    
    /// 内部数组size
    fileprivate var nomarlSize = 0
    
    /// 内部头节点
    fileprivate var first: Node?
    
    /// 内部尾节点
    fileprivate var last: Node?
    
    //MARK: - 增
    /// 增加元素
    /// - Parameter element: 元素
    func append(_ newElement: Element?) {
        let _ = insert(at: nomarlSize, newElement)
    }
    
    func insert(at index: Int, _ newElement: Element?) {
        
        rangeCheck(at: index, addFlag: true)
        
        let newNode = Node(newElement)
        //new - 8 old - 1
        if index == 0 {
            newNode.next = first
            first?.pre = newNode
            first = newNode
            if nomarlSize == 0 {
                last = newNode
            }
//            first?.next = getCurrentNode(at: index  1)
//            getCurrentNode(at: index - 1)?.pre = first?.next
        }else if index == nomarlSize {
            last?.next = newNode
            newNode.pre = last
            last = newNode
            if nomarlSize == 0 {
                first = newNode
            }
//            last?.pre = getCurrentNode(at: index - 1)
//            getCurrentNode(at: index - 1)?.next = last?.pre
        }else {// 1、2、3
            newNode.next = getCurrentNode(at: index)
            newNode.pre = getCurrentNode(at: index - 1)
            getCurrentNode(at: index - 1)?.next = newNode
            getCurrentNode(at: index)?.pre = newNode
        }
        
        nomarlSize += 1
    }
    
    //MARK: - 删 - 返回

    /// 删除元素 - 依赖元素
    /// - Parameter index: 元素索引
    /// - Returns: 原始元素
    func remove(_ newElement: Element?) -> Element? {
        
        return remove(at: index(of: newElement))
        
    }
    
    /// 删除元素 - 依赖索引
    /// - Parameter index: 元素索引
    /// - Returns: 原始元素
    func remove(at index: Int) -> Element? {//正序
        
        rangeCheck(at: index, addFlag: false)
        var pre = index <= 0 ? nil : getCurrentNode(at: index - 1)
        var next = index >= nomarlSize - 1 ? nil : getCurrentNode(at: index + 1)
        let node = getCurrentNode(at: index)
        
        if index == 0 {
            first = next
            first?.pre = nil
        }else if index == nomarlSize - 1 {
            last = pre
            last?.next = nil
        }else {
            pre?.next = next
            next?.pre = pre
        }
        
        nomarlSize -= 1
        pre = nil
        next = nil
        return node?.val
        
    }
    
    //MARK: - 改
    /// 修改元素
    /// - Parameters:
    ///   - index: 元素索引
    ///   - element: 新元素
    /// - Returns: 原始元素
    func replace(at index: Int, _ newElement: Element?) -> Element? {//倒序
        
        rangeCheck(at: index, addFlag: false)
        
        let node = getCurrentNode(at: index)
        
        getCurrentNode(at: index)?.val = newElement
        
        return node?.val
    }
    //MARK: - 查
    /// 根据元素获取索引
    /// - Parameter element: 元素
    /// - Returns: 元素索引
    func index(of newElement: Element?) -> Int {
        
        for i in 0...nomarlSize - 1 {
            
            if let newe = newElement {//有值
                
                if let olde = getCurrentNode(at: i) {
                    if olde.val == newe {
                        return i
                    }
                }
                
            }else {//没有值
                
                guard let _ = getCurrentNode(at: i) else { return i }
                
            }
            
        }
        return nomarlOffRange
    }
    
    /// 根据索引获取对象
    /// - Parameter index: 元素索引
    /// - Returns: 元素
    func element(of index: Int) -> Element? {
        
        rangeCheck(at: index, addFlag: false)
        
        return getCurrentNode(at: index)?.val
    }
    //MARK: - 工具类
    
    /// 异常处理
    fileprivate func rangeCheck(at index: Int, addFlag: Bool, complation: (() -> ())? = nil) {
        
        if (complation != nil) {
            return
        }
        
        if addFlag {
            assert(index >= 0 && index <= nomarlSize, "越界了老铁")
        }else {
            assert(index >= 0 && index < nomarlSize, "越界了老铁")
        }
    }
    
    /// 数组数量
    /// - Returns: 数组数量
    func size() -> Int{ nomarlSize }
    
    /// 清空数组
    func clear() {
        //FIXME: 是否需要清空所有的next pre？ - 需要
        if nomarlSize > 0 {
            var node = first
            for i in (0...nomarlSize - 1) {
                node?.pre = nil
                node = node?.next
                
            }
            for i in (0...nomarlSize - 1).reversed() {
                node?.next = nil
                node = node?.pre
            }
        }
        first = nil
        last = nil
        nomarlSize = 0
    }
    
    /// 是否为空
    /// - Returns: 是否为空
    func isEmpty() -> Bool { nomarlSize == 0 }
    
    /// 是否包含某个元素
    /// - Parameter element: 元素
    /// - Returns: 是否包含
    func contains(_ newElement: Element?) -> Bool {index(of: newElement) != nomarlOffRange }
    
    /// 获取指定索引下的node
    /// - Parameter index: 索引
    /// - Returns: node
    fileprivate func getCurrentNode(at index: Int) -> Node? {
        
        rangeCheck(at: index, addFlag: false) {
            
        }
        
        if index == 0 {
            return first
        }else if index == nomarlSize - 1 {
            return last
        }else {
            
            if index <= (nomarlSize - 1) / 2 {//左侧
                var node = first
                
                // 0 - 1 - 2
                // 1 - 2 - 3
                for _ in 1...index {
                    node = node?.next
                }
                return node
            }else {//右侧
                var node = last
                
                // 0 - 1 - 2
                // 1 - 2 - 3
                for _ in (index + 1...nomarlSize - 1).reversed() {
                    node = node?.pre
                }
                return node
            }
            
        }
    }
    
}

extension LinkedList1: CustomStringConvertible {
    
    var description:String {
        
        var string = "size: \(nomarlSize), elements:["
        
        var stringList: [Element?] = []
        
        if nomarlSize > 0 {
            for i in 0...nomarlSize - 1 {
                
                var s = ""
                if i - 1 >= 0 {
                    s.append("\(getCurrentNode(at: i - 1)?.val)")
                }else {
                    s.append("nil")
                }
                
                s.append("_")
                s.append("\(getCurrentNode(at: i)?.val)")
                s.append("_")
                if i + 1 <= nomarlSize - 1 {
                    s.append("\(getCurrentNode(at: i + 1)?.val)")
                }else {
                    s.append("nil")
                }
                
                s.append("    ")
                string.append(s)
            }
        }
        
        string.append("\(stringList.enumerated())")
        
        string.append("]")
        
        return string
//        guard let arr = arrayList else { return "" }
//        return "size: \(nomarlSize), elements:[\(arr.enumerated())]"
    }
}
