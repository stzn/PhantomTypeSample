//
//  Customer.swift
//  PhantomType
//
//  Created by Shinzan Takata on 2019/03/14.
//  Copyright © 2019 shiz. All rights reserved.
//

import Foundation

// お客様
public final class Customer {

    public typealias ID = Identifier<Customer, String>

    public let id: ID
    public var cart: Cart
    public init(id: ID, cart: Cart = Cart()) {
        self.id = id
        self.cart = cart
    }
    
    public func addItem(_ item: Item, count: Int) {
        cart.add(item: item, count: count)
    }
    
    public func decreaseItem(_ item: Item, count: Int) {
        cart.decrease(item: item, count: count)
    }
    
    public func removeItem(_ item: Item) {
        cart.remove(item: item)
    }
    
    public func order() -> Order<Ordered> {
        return Order<Ordered>(id: id, cart: cart)
    }
}
