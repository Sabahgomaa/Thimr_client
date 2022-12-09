class AddAddressesData {
  late final String status;
  late final String message;
  late final Addresses data;

  AddAddressesData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Addresses.fromJson(json['data']);
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