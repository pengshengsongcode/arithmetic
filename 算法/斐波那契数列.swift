//
//  斐波那契数列.swift
//  算法
//
//  Created by pengshengsong on 2021/4/26.
//

import Foundation
//0 1 1 2 3 5 8 13
class Solution {
    
    func fib(_ n: Int) -> Int {
//        return fib2nfang(n)
        return fibn(n)
    }
    
    //时间复杂度 - O(2^n)
    //空间复杂度 - O(1)
    func fib2nfang(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        return fib2nfang(n - 1) + fib2nfang(n - 2)
    }
    
    //时间复杂度 - O(n)
    //空间复杂度 - O(1)
    func fibn(_ n: Int) -> Int {
        
        if n <= 1 {
            return n
        }
        
        var first = 0
        var secend = 1
        
        for _ in 0...n-2 {
            let sum = first + secend
            first = secend
            secend = sum
        }
        
        return secend
    }
    
    func fibn2(_ n: Int) -> Int {
        
        //时间复杂度 - O(2^n)
        //控件复杂度 - O(1)
        if n <= 1 {
            return n
        }
        
        var first = 0
        var secend = 1
        var m = n
        while m > 1 {
            secend = first + secend
            first = secend - first
            m -= 1
        }
        return secend
    }
    
}
