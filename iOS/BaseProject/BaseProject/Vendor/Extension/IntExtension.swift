//
//  IntExtension.swift
//  BaseProject
//
//  Created by YYang1 on 10/9/18.
//  Copyright © 2018 YYang. All rights reserved.
//

import Foundation

extension Int{
    /// 是偶数
    public var y_isEven:Bool     {return (self % 2 == 0)}
    /// 是奇数
    public var y_isOdd:Bool      {return (self % 2 != 0)}
    /// 是整数
    public var y_isPositive:Bool {return (self >= 0)}
    /// 是负数
    public var y_isNegative:Bool {return (self < 0)}
    /// 转为double
    public var y_toDouble:Double {return Double(self)}
    /// 转为float
    public var y_toFloat:Float   {return Float(self)}
}

extension Double {
    //四舍五入 双精度小数转为整形
    public func y_roundoff() -> Int
    {
        let a = Int(self)
        let b = Double(a)+0.5
        if(self > b)
        { return a+1 }
        else
        { return a }
    }
}