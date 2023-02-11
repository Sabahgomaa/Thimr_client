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
  late final int unreadNotificationsCount;
  late final List<Notifications> notifications;

  Data.fromJson(Map<String, dynamic> json){
    unreadNotificationsCount = json['unreadnotifications_count'];
    notifications = List.from(json['notifications']??[]).map((e)=>Notifications.fromJson(e)).toList();
  }

}

class Notifications {

  late final String id;
  late final String title;
  late final String body;
  late final String notifyType;
  // late final Null order;
  // late final Null offer;
  // late final Null chat;
  late final String createdAt;
  late final String readAt;
  late final String image;

  Notifications.fromJson(Map<String, dynamic> json){
    id = json['id']??1;
    title = json['title']??"";
    body = json['body']??"";
    notifyType = json['notify_type']??"";
    // order = null;
    // offer = null;
    // chat = null;
    createdAt = json['created_at'];
    readAt = json['read_at'];
    image = json['image'];
  }

}

class Links {

  late final String first;
  late final String last;


  Links.fromJson(Map<String, dynamic> json){
    first = json['first'] ?? '';
    last = json['last']??"";
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
    currentPage = json['current_page']??1;
    from = json['from']??1;
    lastPage = json['last_page']??1;
    links = List.from(json['links']??[]).map((e)=>Links.fromJson(e)).toList();
    path = json['path']??"";
    perPage = json['per_page']??1;
    to = json['to']??1;
    total = json['total']??1;
  }

}
