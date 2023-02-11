class AddAddressesData {
  late final String status;
  late final String message;
  late final Address data;

  AddAddressesData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Address.fromJson(json['data']);
  }

}

class Address {
  late final int id;
  late final String type;
  late final double lat;
  late final double lng;
  late final String location;
  late final String description;
  late final bool isDefault;
  late final String phone;

  Address.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    type = json['type']??"";
    lat = json['lat']??0;
    lng = json['lng']??0;
    location = json['location'];
    description = json['description']??"";
    isDefault = json['is_default']??false;
    phone = json['phone'] ?? "";
  }

}