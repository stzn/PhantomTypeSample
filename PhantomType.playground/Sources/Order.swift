import Foundation

public final class Order<T: OrderState> {
    private let id: Customer.ID
    private let store: TransactionStorable
    private var item: OrderedItem
    public init(id: Customer.ID,
         store: TransactionStorable = TransactionStore.shared,
         item: OrderedItem) {
        self.id = id
        self.store = store
        self.item = item
    }
    
    public func printHistory() {
        store.report()
    }
}

// 注文済状態へ
extension Order where T == Ordered {
    public convenience init(id: Customer.ID, cart: Cart) {
        self.init(id: id, item: OrderedItem(items: cart.items))
    }
}

// 請求済状態へ
extension Order where T: Billable {
    public var bill: Order<Billed> {
        let transacton = Transaction(id: self.id, name: "Bill",
                                     details: ["amount": item.amount])
        TransactionStore.shared.save(transaction: transacton)
        return Order<Billed>(id: self.id, item: self.item)
    }
    var billingAmount: Int {
        return item.amount
    }
}

// 支払い済状態へ
extension Order where T: Payable {
    public var pay: Order<Paid> {
        let transacton = Transaction(id: self.id, name: "Paid",
                                     details: ["amount": item.amount])
        TransactionStore.shared.save(transaction: transacton)
        return Order<Paid>(id: self.id, item: self.item)
    }
    var paidAmount: Int {
        return item.amount
    }
}

// キャンセル済み状態へ
extension Order where T: Cancellable {
    public var cancel: Order<Cancelled> {
        let transacton = Transaction(id: self.id, name: "Cancel",
                                     details: ["Items": item])
        store.save(transaction: transacton)
        return Order<Cancelled>(id: self.id, item: self.item)
    }
}

// 返金済状態へ
extension Order where T: Refundable {
    public var refund: Order<Refunded> {
        let transacton = Transaction(id: self.id, name: "Refund",
                                     details: ["amount": item.amount])
        TransactionStore.shared.save(transaction: transacton)
        return Order<Refunded>(id: self.id, item: self.item)
    }
    var refundableAmount: Int {
        return item.amount
    }
}

// 配達済状態へ
extension Order where T == Paid {
    public var deliver: Order<Delivered> {
        let transacton = Transaction(id: self.id, name: "Deliver",
                                     details: ["Items": item])
        store.save(transaction: transacton)
        return Order<Delivered>(id: self.id, item: self.item)
    }
}

// 返品済状態へ
extension Order where T: Returnable {
    public var orderReturn: Order<Returned> {
        let transacton = Transaction(id: self.id, name: "Return",
                                     details: ["amount": item.amount])
        TransactionStore.shared.save(transaction: transacton)
        return Order<Returned>(id: self.id, item: self.item)
    }
    var returnableAmount: Int {
        return item.amount
    }
}
