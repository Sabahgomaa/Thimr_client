class FavoriteData {
  late final List<Favorite> favorites;
  late final String status;
  late final String message;

  FavoriteData.fromJson(Map<String, dynamic> json) {
    favorites = List.from(json['data']??[]).map((e) => Favorite.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class Favorite {
  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final num priceBeforeDiscount;
  late final num price;
  late final double discount;
  late final int amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

  Favorite.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id']??1;
    id = json['id']??1;
    title = json['title']??"";
    description = json['description']??"";
    code = json['code']??"";
    priceBeforeDiscount = json['price_before_discount']??1;
    price = json['price']??1;
    discount = json['discount']??1;
    amount = json['amount']??1;
    isActive = json['is_active'];
    isFavorite = json['is_favorite']??false;
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    mainImage = json['main_image'];
    createdAt = json['created_at'];
  }
}

class Unit {
  late final int id;
  late final String name;
  late final String type;

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }
}

class Images {
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
