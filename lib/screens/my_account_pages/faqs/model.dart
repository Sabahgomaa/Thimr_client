class FAQsData {
  FAQsData({
    required this.data,
    required this.status,
    required this.message,
  });
  late final List<Data> data;
  late final String status;
  late final String message;

  FAQsData.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }


}

class Data {
  Data({
    required this.id,
    required this.question,
    required this.answer,
  });
  late final int id;
  late final String question;
  late final String answer;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id']??1;
    question = json['question']??"";
    answer = json['answer']??"";
  }

}