class ContactUsData {
  late final Contacts contacts;
  late final String status;
  late final String message;

  ContactUsData.fromJson(Map<String, dynamic> json) {
    contacts = Contacts.fromJson(json['data'] ?? []);
    status = json['status'];
    message = json['message'];
  }
}

class Contacts {
  late final String phone;
  late final String email;
  late final String whatsapp;
  late final Social social;
  late final double lat;
  late final double lng;
  late final String location;

  Contacts.fromJson(Map<String, dynamic> json) {
    phone = json['phone']??"";
    email = json['email']??"";
    whatsapp = json['whatsapp']??"";
    social = Social.fromJson(json['social']);
    lat = json['lat']??100;
    lng = json['lng']??100;
    location = json['location']??"";
  }
}

class Social {
  late final String facebook;
  late final String twitter;
  late final String instagram;

  Social.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
  }
}
