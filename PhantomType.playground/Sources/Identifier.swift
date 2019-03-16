//
//  Identifier.swift
//  PhantomType
//
//  Created by Shinzan Takata on 2019/03/14.
//  Copyright © 2019 shiz. All rights reserved.
//

import Foundation

public struct Identifier<T, RawValue> {
    let value: RawValue
    init(_ value: RawValue) {
        self.value = value
    }
}

extension Identifier: Equatable where RawValue: Equatable {
    public static func == (lhs: Identifier<T, RawValue>, rhs: Identifier<T, RawValue>) -> Bool {
        return lhs.value == rhs.value
    }
}

extension Identifier: Hashable where RawValue: Hashable {
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(self.value)
    }
}

extension Identifier: CustomStringConvertible {
    public var description: String {
        return String(describing: value)
    }
}

extension Identifier: ExpressibleByExtendedGraphemeClusterLiteral where RawValue: ExpressibleByExtendedGraphemeClusterLiteral {
    public typealias ExtendedGraphemeClusterLiteralType = RawValue.ExtendedGraphemeClusterLiteralType
    
    public init(extendedGraphemeClusterLiteral: ExtendedGraphemeClusterLiteralType) {
        self.init(RawValue(extendedGraphemeClusterLiteral: extendedGraphemeClusterLiteral))
    }
}

extension Identifier: ExpressibleByStringLiteral where RawValue: ExpressibleByStringLiteral {
    public typealias StringLiteralType = RawValue.StringLiteralType
    
    public init(stringLiteral: StringLiteralType) {
        self.init(RawValue(stringLiteral: stringLiteral))
    }
}

extension Identifier: ExpressibleByUnicodeScalarLiteral where RawValue: ExpressibleByUnicodeScalarLiteral {
    public typealias UnicodeScalarLiteralType = RawValue.UnicodeScalarLiteralType
    
    public init(unicodeScalarLiteral: UnicodeScalarLiteralType) {
        self.init(RawValue(unicodeScalarLiteral: unicodeScalarLiteral))
    }
}
