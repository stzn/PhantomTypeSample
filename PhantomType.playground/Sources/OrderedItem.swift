//
//  OrderedItem.swift
//  PhantomType
//
//  Created by Shinzan Takata on 2019/03/14.
//  Copyright © 2019 shiz. All rights reserved.
//

import Foundation

// 注文した商品
public struct OrderedItem {
    public var items: [Item: Int]
    public init(items: [Item: Int] = [:]) {
        self.items = items
    }
    public var amount: Int {
        return items.reduce(0) { total, partial in
            var total = total
            total += partial.key.price * partial.value
            return total
        }
    }
}

extension OrderedItem: CustomStringConvertible {
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

