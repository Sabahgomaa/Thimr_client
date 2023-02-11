class CurrentOrderData {
  late final List<CurrentOrder> data;
  late final Links links;
  late final Meta meta;
  late final String status;
  late final String message;

  CurrentOrderData.fromJson(Map<String, dynamic> json) {
    data =
        List.from(json['data'] ?? []).map((e) => CurrentOrder.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
    status = json['status'];
    message = json['message'];
  }
}

class CurrentOrder {
  late final int id;
  late final String status;
  late final String date;
  late final String time;
  late final num orderPrice;
  late final num deliveryPrice;
  late final num totalPrice;
  late final String clientName;
  late final String phone;
  late final String location;
  late final String deliveryPayer;
  late final List<Products> products;
  late final String payType;
  late final String note;
  late final int isVip;
  late final int vipDiscountPercentage;

  CurrentOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 1;
    status = json['status'] ?? "";
    date = json['date'] ?? "";
    time = json['time'] ?? "";
    orderPrice = json['order_price'] ?? 1;
    deliveryPrice = json['delivery_price'] ?? 1;
    totalPrice = json['total_price'] ?? 1;
    clientName = json['client_name'] ?? "";
    phone = json['phone'] ?? 'ds';
    location = json['location'] ?? '';
    deliveryPayer = json['delivery_payer'] ?? "";
    products = List.from(json['products'] ?? [])
        .map((e) => Products.fromJson(e))
        .toList();
    payType = json['pay_type'] ?? "";
    note = json['note'] ?? '';
    isVip = json['is_vip'] ?? 1;
    vipDiscountPercentage = json['vip_discount_percentage'] ?? 1;
  }
}

class Products {
  late final String name;
  late final String url;

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class Links {
  late final Null prev;
  late final Null next;

  Links.fromJson(Map<String, dynamic> json) {
    prev = null;
    next = null;
  }
}

class Meta {
  late final int currentPage;
  late final num from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] ?? 1;
    from = json['from'] ?? 2;
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'] ?? 1;
    total = json['total'];
  }
}
