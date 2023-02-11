class ShowProductData {

  late final String status;
  late final String message;
  late final ShowProducts data;

  ShowProductData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = ShowProducts.fromJson(json['data']);
  }


}

class ShowProducts {

  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final int priceBeforeDiscount;
  late final num price;
  late final double discount;
  late final int amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

  ShowProducts.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id']??1;
    id = json['id']??1;
    title = json['title']??"";
    description = json['description']??"";
    code = json['code']??"";
    priceBeforeDiscount = json['price_before_discount']??1;
    price = json['price']??1;
    discount = json['discount']??1;
    amount = json['amount']??1;
    isActive = json['is_active']??1;
    isFavorite = json['is_favorite']?? false;
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
    mainImage = json['main_image'];
    createdAt = json['created_at'];
  }


}

class Unit {

  late final int id;
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class Images {

  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }


}