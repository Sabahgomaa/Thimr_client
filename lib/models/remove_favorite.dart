class RemoveFavoriteModel {

  late final String status;
  late final String message;
  late final  data;

  RemoveFavoriteModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data ;
  }

}