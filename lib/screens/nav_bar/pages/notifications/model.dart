class NotificationsData {
  late final Data data;
  late final Links links;
  late final Meta meta;
  late final String status;
  late final String message;

  NotificationsData.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
    status = json['status'];
    message = json['message'];
  }

}

class Data {
  late final int unreadnotificationsCount;
  late final List<Notifications> notifications;

  Data.fromJson(Map<String, dynamic> json){
    unreadnotificationsCount = json['unreadnotifications_count'];
    notifications = List.from(json['notifications']).map((e)=>Notifications.fromJson(e)).toList();
  }

}

class Notifications {

  late final String id;
  late final String title;
  late final String body;
  late final String notifyType;
  late final Null order;
  late final Null offer;
  late final Null chat;
  late final String createdAt;
  late final String readAt;
  late final String image;

  Notifications.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    body = json['body'];
    notifyType = json['notify_type'];
    order = null;
    offer = null;
    chat = null;
    createdAt = json['created_at'];
    readAt = json['read_at'];
    image = json['image'];
  }

}

class Links {

  late final String first;
  late final String last;
  late final Null prev;
  late final Null next;

  Links.fromJson(Map<String, dynamic> json){
    first = json['first'] ?? '';
    last = json['last']??"";
    prev = null;
    next = null;
  }

}

class Meta {
  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

  Meta.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

}
