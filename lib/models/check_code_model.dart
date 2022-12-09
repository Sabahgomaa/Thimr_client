class CheckCodeModel {
  CheckCodeModel({
    required this.status,
    this.data,
    required this.message,
    required this.isActive,
  });
  late final String status;
  late final Null data;
  late final String message;
  late final bool isActive;

  CheckCodeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = null;
    message = json['message'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data;
    _data['message'] = message;
    _data['is_active'] = isActive;
    return _data;
  }
}