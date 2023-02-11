class CityDataModel {
  late final List<Cities> data;
  late final String status;
  late final String message;

  CityDataModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Cities.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class Cities {
  late final String id;
  late final String name;

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
  }
}
