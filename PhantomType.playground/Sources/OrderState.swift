//
//  OrderState.swift
//  PhantomType
//
//  Created by Shinzan Takata on 2019/03/14.
//  Copyright © 2019 shiz. All rights reserved.
//

import Foundation

public protocol OrderState {}

public protocol Billable {}
public protocol Payable {}
public protocol Cancellable {}
public protocol Refundable {}
public protocol Returnable {}

public enum Ordered: OrderState, Cancellable, Billable {}
public enum Billed: OrderState, Cancellable, Payable {}
public enum Paid: OrderState, Refundable {}
public enum Delivered: OrderState, Returnable {}

public enum Cancelled: OrderState {}
public enum Refunded: OrderState {}
public enum Returned: OrderState {}
