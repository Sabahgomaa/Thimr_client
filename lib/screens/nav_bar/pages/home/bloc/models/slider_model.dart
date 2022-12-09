class SliderData {
  SliderData({
    required this.data,
    required this.status,
    required this.message,
  });
  late final List<Sliders> data;
  late final String status;
  late final String message;

  SliderData.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Sliders.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }

}

class Sliders {
  Sliders({
    required this.id,
    required this.media,
  });
  late final int id;
  late final String media;

  Sliders.fromJson(Map<String, dynamic> json){
    id = json['id'];
    media = json['media'];
  }

}