class AboutData {
  late final AboutApp aboutApp;
  late final String status;
  late final String message;

  AboutData.fromJson(Map<String, dynamic> json) {
    aboutApp = AboutApp.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class AboutApp {
  late final String about;

  AboutApp.fromJson(Map<String, dynamic> json) {
    about = json['about'] ?? "";
  }
}
