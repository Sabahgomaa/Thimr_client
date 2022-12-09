class ResendCodeModel {
  ResendCodeModel({
    required this.status,
    this.data,
    required this.message,
    required this.isActive,
    required this.devMessage,
  });
  late final String status;
  late final Null data;
  late final String message;
  late final bool isActive;
  late final int devMessage;

  ResendCodeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = null;
    message = json['message'];
    isActive = json['is_active'];
    devMessage = json['dev_message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data;
    _data['message'] = message;
    _data['is_active'] = isActive;
    _data['dev_message'] = devMessage;
    return _data;
  }
}