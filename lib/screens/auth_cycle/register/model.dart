class RegisterModel {
  late final String status;
  late final String message;
  late final int devMessage;

  RegisterModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    devMessage = json['dev_message'];
  }
}