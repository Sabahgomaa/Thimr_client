class PolicyData {
  PolicyData({
    required this.data,
    required this.status,
    required this.message,
  });
  late final Data data;
  late final String status;
  late final String message;

  PolicyData.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  Data({
    required this.policy,
  });
  late final String policy;

  Data.fromJson(Map<String, dynamic> json){
    policy = json['policy'];
  }

}