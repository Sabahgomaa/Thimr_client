class AddFavoriteModel {
  late final String status;
  late final String message;
  late final  data;

  AddFavoriteModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data ;
  }


}