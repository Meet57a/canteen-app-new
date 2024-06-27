class OrderProductModel {
  final String orderId;
  final String productId;
  final int orderQuantity;
  final double deliveryCharge;
  final double taxAndFees;
  final int discount;
  final String orderStatus;
  final String orderPaymentStatus;
  final double orderTotal;
  final String? orderTimeRequired;
  final String orderDate;
  final String orderTime;

  OrderProductModel({
    required this.orderId,
    required this.productId,
    required this.orderQuantity,
    required this.deliveryCharge,
    required this.taxAndFees,
    required this.discount,
    required this.orderStatus,
    required this.orderPaymentStatus,
    required this.orderTotal,
    this.orderTimeRequired,
    required this.orderDate,
    required this.orderTime,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      orderId: json['OrderId'],
      productId: json['ProductId'],
      orderQuantity: json['OrderQuantity'],
      deliveryCharge: json['OrderDiliveryCharge'],
      taxAndFees: json['OrderTax'],
      discount: json['OrderDiscount'],
      orderStatus: json['OrderStatus'],
      orderPaymentStatus: json['OrderPayment'],
      orderTotal: json['OrderTotal'],
      orderTimeRequired: json['OrderTimeRequired'],
      orderDate: json['createdAt'].toString(),
      orderTime: json['createdAt'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_quantity': orderQuantity,
      'order_dilivery_charge': deliveryCharge,
      'order_tax': taxAndFees,
      'order_discount': discount,
      'order_status': orderStatus,
      'order_payment': orderPaymentStatus,
      'order_total': orderTotal,
      // 'OrderTimeRequired': orderTimeRequired,
    };
  }
}
