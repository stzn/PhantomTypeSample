//
//  Item.swift
//  PhantomType
//
//  Created by Shinzan Takata on 2019/03/14.
//  Copyright © 2019 shiz. All rights reserved.
//

import Foundation

// 商品
public struct Item: Hashable {
    public let id: ID
    public let price: Int
    
    public typealias ID = Identifier<Item, String>
    
    public init(id: ID, price: Int) {
        self.id =  id
        self.price = price
    }
}

