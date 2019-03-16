//
//  Transaction.swift
//  PhantomType
//
//  Created by Shinzan Takata on 2019/03/14.
//  Copyright © 2019 shiz. All rights reserved.
//

import Foundation

// 取引の記録
public struct Transaction {
    public let id: Customer.ID
    public let name: String
    public let timestamp: Double
    public let details: [String: Any]?

    public init(id: Customer.ID, name: String,
         timestamp: Double = Date().timeIntervalSinceNow, details: [String: Any]? = nil) {
        self.id = id
        self.name = name
        self.timestamp = timestamp
        self.details = details
    }
}

extension Transaction: CustomStringConvertible {
    public var description: String {
        var string = """
        ========\(name)============
        お客様番号: \(id)
        """
        if let details = details {
            string += "\n内容\n"
            details.forEach { (key, value) in string += "\(key)\n\(String(describing: value))" }
        }
        string += "\n"
        return string
    }
}


