class AboutData {
  AboutData({
    required this.data,
    required this.status,
    required this.message,
  });
  late final Data data;
  late final String status;
  late final String message;

  AboutData.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }

}

class Data {
  Data({
    required this.about,
  });
  late final String about;

  Data.fromJson(Map<String, dynamic> json){
    about = json['about']??"";
  }


}