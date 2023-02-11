class ProductRateData {
  late final List<Rates> data;
  // late final Links links;
  // late final Meta meta;
  late final String status;
  late final String message;

  ProductRateData.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Rates.fromJson(e)).toList();
    // links = Links.fromJson(json['links']);
    // meta = Meta.fromJson(json['meta']);
    status = json['status'];
    message = json['message'];
  }
}

class Rates {
  late final int value;
  late final String comment;
  late final String clientName;
  late final String clientImage;

  Rates.fromJson(Map<String, dynamic> json) {
    value = json['value'] ?? 1;
    comment = json['comment']??"";
    clientName = json['client_name']??"";
    clientImage = json['client_image']??"";
  }
}

// class Links {
//   late final String first;
//   late final String last;
//   late final Null prev;
//   late final String next;
//
//   Links.fromJson(Map<String, dynamic> json) {
//     first = json['first']??"";
//     last = json['last']??"";
//     prev = null;
//     next = json['next'];
//   }
// }
//
// class Meta {
//   late final int currentPage;
//   late final int from;
//   late final int lastPage;
//   late final List<Links> links;
//   late final String path;
//   late final int perPage;
//   late final int to;
//   late final int total;
//
//   Meta.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
//     path = json['path'];
//     perPage = json['per_page'];
//     to = json['to'];
//     total = json['total'];
//   }
//}
