class ShowOrdersData {
  late final List<ShowOrder> data;
  late final String status;
  late final String message;

  ShowOrdersData.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data'] ?? [])
        .map((e) => ShowOrder.fromJson(e))
        .toList();
    status = json['status'];
    message = json['message'];
  }
}

class ShowOrder {
  late final int id;
  late final String status;
  late final String date;
  late final String time;
  late final double? orderPrice;
  late final int deliveryPrice;
  late final double? totalPrice;
  late final String clientName;
  late final String? phone;
  late final String? location;
  late final String deliveryPayer;
  late final List<Products> products;
  late final String payType;
  late final String? note;
  late final int isVip;
  late final int vipDiscountPercentage;

  ShowOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 1;
    status = json['status'] ?? "";
    date = json['date'] ?? "";
    time = json['time'] ?? "";
    orderPrice = json['order_price'] ?? 1;
    deliveryPrice = json['delivery_price'] ?? 1;
    totalPrice = json['total_price'] ?? 1;
    clientName = json['client_name'] ?? "";
    phone = json['phone'] ?? "";
    location = json['location'] ?? "";
    deliveryPayer = json['delivery_payer'] ?? "";
    products = List.from(json['products'] ?? [])
        .map((e) => Products.fromJson(e))
        .toList();
    payType = json['pay_type'] ?? "";
    note = json['note'] ?? "";
    isVip = json['is_vip'] ?? 1;
    vipDiscountPercentage = json['vip_discount_percentage'] ?? 1;
  }
}

class Products {
  late final String name;
  late final String url;

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    url = json['url'] ?? "";
  }
}
