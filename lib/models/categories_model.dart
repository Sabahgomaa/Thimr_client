class CategoriesData {
  late final List<Category> categories;
  late final String status;
  late final String message;

  CategoriesData.fromJson(Map<String, dynamic> json){
    categories = json['data']==null?[]:List.from(json['data']).map((e)=>Category.fromJson(e)).toList();
    status = json['status']??"";
    message = json['message']??"";
  }
}

class Category {
  late final int id;
  late final String name;
  late final String description;
  late final String media;

  Category.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??"";
    description = json['description']??"";
    media = json['media']??"";
  }
}
