//
//  Cart.swift
//  PhantomType
//
//  Created by Shinzan Takata on 2019/03/14.
//  Copyright © 2019 shiz. All rights reserved.
//

import Foundation

// お客が注文する前の商品を入れるカート
public final class Cart {
    public var items: [Item: Int] = [:]
    
    public init() {}
    
    public func add(item: Item, count: Int) {
        if items[item] != nil {
            items[item]! += count
        } else {
            items[item] = count
        }
    }
    
    public func decrease(item: Item, count: Int) {
        if items[item] != nil {
            items[item]! -= count
        }
    }
    
    public func remove(item: Item) {
        if items[item] != nil {
            items[item] = nil
        }
    }
    
    public func clear() {
        items = [:]
    }
}

extension Cart: CustomStringConvertible {
    public var description: String {
        var string = ""
        items.forEach { (item, count) in
            string += """
            商品ID: \(item.id)
            価格: \(item.price)
            個数: \(count)
            """
        }
        return string
    }
}

