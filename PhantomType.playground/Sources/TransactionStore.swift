//
//  TransactionStore.swift
//  PhantomType
//
//  Created by shinzan_takata on 2019/03/14.
//  Copyright © 2019 shiz. All rights reserved.
//

import Foundation

// 取引の記録を保存するもの
public protocol TransactionStorable {
    func save(transaction: Transaction)
    func report()
}

public final class TransactionStore {
    public static let shared = TransactionStore()
    private init() {}
    var transactions: [Transaction] = []
}
extension TransactionStore: TransactionStorable {
    public func save(transaction: Transaction) {
        transactions.append(transaction)
    }
    
    public func report() {
        transactions.forEach { Swift.print($0) }
    }
}
