class FAQsData {
  late final List<FAQ> data;
  late final String status;
  late final String message;

  FAQsData.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => FAQ.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class FAQ {
  late final int id;
  late final String question;
  late final String answer;

  FAQ.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 1;
    question = json['question'] ?? "";
    answer = json['answer'] ?? "";
  }
}
