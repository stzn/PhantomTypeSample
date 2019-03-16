let customer = Customer(id: "hoge")
let ball = Item(id: "ball", price: 100)
customer.addItem(ball, count: 25)

let result = customer.order().cancel
result.printHistory()

// 'Order<Ordered>' is not a subtype of 'Order<Paid>'
//let result2 = customer.order().deliver

// 'Order<Refunded>' is not a subtype of 'Order<Paid>'
//let result2 = customer.order().bill.pay.refund.deliver

let result2 = customer.order().bill.pay.deliver
result2.printHistory()
