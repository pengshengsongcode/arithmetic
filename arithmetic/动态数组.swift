//
//  动态数组.swift
//  算法
//
//  Created by pengshengsong on 2021/4/27.
//

import Foundation

class ArrayList<Element: Equatable> {
    
    /// 默认容量
    fileprivate let nomarlCapaticy = 10
    
    /// 默认越界索引
    fileprivate let nomarlOffRange = -1
    
    /// 内部数组size
    fileprivate var nomarlSize = 0
    
    /// 内部数组
    fileprivate var arrayList: [Element?]?
    
    //MARK: - 析构函数
    /// 析构函数
    /// - Parameter capaticy: 容量
    convenience init(capaticy: Int) {
        self.init()
        
        arrayList = Array.init(repeating: nil, count: capaticy > nomarlCapaticy ? capaticy : nomarlCapaticy)
        
    }
    
    //MARK: - 增
    /// 增加元素
    /// - Parameter element: 元素
    func append(_ newElement: Element?) {
        let _ = insert(at: nomarlSize, newElement)
    }
    
    func insert(at index: Int, _ newElement: Element?) {//倒序
        
        rangeCheck(at: index, addFlag: true)
        
        ensureCapacity(index)
        
        guard var arr = arrayList else { return }
        
        for i in (index..<nomarlSize).reversed() {
            arr[i + 1] = arr[i]
        }
        
        arr[index] = newElement
        
        nomarlSize += 1
        
        arrayList = arr
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
        
        guard var arr = arrayList else { return nil }
        
        let old = element(of: index)
        
        arr[index] = nil
        
        for i in (index..<nomarlSize - 1) {
            arr[i] = arr[i + 1]
        }
        
        nomarlSize -= 1
        
        arrayList = arr
        
        return old
        
    }
    
    //MARK: - 改
    /// 修改元素
    /// - Parameters:
    ///   - index: 元素索引
    ///   - element: 新元素
    /// - Returns: 原始元素
    func replace(at index: Int, _ newElement: Element?) -> Element? {//倒序
        
        rangeCheck(at: index, addFlag: false)
        
        guard var arr = arrayList else { return nil }
        
        let old = element(of: index)
        
        arr[index] = newElement
        
        arrayList = arr
        
        return old
    }
    //MARK: - 查
    /// 根据元素获取索引
    /// - Parameter element: 元素
    /// - Returns: 元素索引
    func index(of newElement: Element?) -> Int {
        
        guard let arr = arrayList else { return 0 }
        
        for (i, e) in arr.enumerated() {
            
            if let newe = newElement {//有值
                
                if let olde = e {
                    if olde == newe {
                        return i
                    }
                }
                
            }else {//没有值
                
                guard let _ = e else { return i }
                
            }
            
        }
        return nomarlOffRange
    }
    
    /// 根据索引获取对象
    /// - Parameter index: 元素索引
    /// - Returns: 元素
    func element(of index: Int) -> Element? {
        
        rangeCheck(at: index, addFlag: false)
        
        guard let arr = arrayList else { return nil }
        
        return arr[index]
    }
    //MARK: - 工具类
    
    /// 扩容
    /// - Parameter capacity: 扩容量
    fileprivate func ensureCapacity(_ capacity: Int) {
        
        guard let arr = arrayList else { return }
        
        if capacity > arr.count {//需要扩容 - 扩容1.5倍
            
            let newCapacity = arr.count + arr.count << 1
            
            var newArr: [Element?] = Array.init(repeating: nil, count: newCapacity)
            
            for i in 0...arr.count - 1 {
                newArr[i] = arr[i]
            }
            
            arrayList = newArr
            
        }else {//不需要扩容
            //--
        }
        
    }
    
    /// 异常处理
    fileprivate func rangeCheck(at index: Int, addFlag: Bool) {
        
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
        guard var arr = arrayList else { return }
        for i in 0...nomarlSize - 1 {
            arr[i] = nil
        }
        arrayList = arr
        nomarlSize = 0
    }
    
    /// 是否为空
    /// - Returns: 是否为空
    func isEmpty() -> Bool { nomarlSize == 0 }
    
    /// 是否包含某个元素
    /// - Parameter element: 元素
    /// - Returns: 是否包含
    func contains(_ newElement: Element?) -> Bool {index(of: newElement) != nomarlOffRange }
    
}

extension ArrayList: CustomStringConvertible {
    
    var description:String {
        guard let arr = arrayList else { return "" }
        return "size: \(nomarlSize), elements:[\(arr.enumerated())]"
    }
}
