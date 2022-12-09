import '../../../shared/core/cach_helper.dart';

class UserModel {
  late final UserData data;
  late final String status;
  late final String message;

  UserModel.fromJson(Map<String, dynamic> json) {
    data = UserData.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class UserData {
  late final int id;
  late final String fullName;
  late final String phone;
  late final String email;
  late final String image;
  late final int isBan;
  late final bool isActive;
  late final int unreadNotifications;
  late final String userType;
  late final String token;
  late final country;
  late final city;
  late final identityNumber;
  late final int userCartCount;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    fullName = json['fullname'] ?? "";
    phone = json['phone'] ?? "";
    email = json['email'] ?? "";
    image = json['image'] ?? "";
    isBan = json['is_ban'] ?? "";
    isActive = json['is_active'] ?? '';
    unreadNotifications = json['unread_notifications'] ?? "";
    userType = json['user_type'] ?? "";
    token = json['token'] ?? "";
    country = '';
    city = '';
    identityNumber = '';
    userCartCount = json['user_cart_count'];
    cashToShared();
  }

  cashToShared() {
    CacheHelper.setUserToken(token);
    CacheHelper.setPhone(phone);
    CacheHelper.setUserId(id);
    CacheHelper.setName(fullName);
    CacheHelper.setImage(image);
  }
}
