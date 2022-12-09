class AddressesData {
  late final List<Addresses> addresses;
  late final String status;
  late final String message;

  AddressesData.fromJson(Map<String, dynamic> json){
    addresses = List.from(json['data']).map((e)=>Addresses.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class Addresses {
  late final int id;
  late final String type;
  late final double lat;
  late final double lng;
  late final String location;
  late final String description;
  late final bool isDefault;
  late final String phone;

  Addresses.fromJson(Map<String, dynamic> json){
    id = json['id']??1;
    type = json['type']??"";
    lat = json['lat']??100;
    lng = json['lng']??100;
    location = json['location']??"";
    description = json['description']??"";
    isDefault = json['is_default']??false;
    phone = json['phone']??"";
  }
}