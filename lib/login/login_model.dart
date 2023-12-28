class LoginModel {
  bool? status;
  String? message;
  Userdata? data;

  LoginModel.formjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Userdata.formjson(json['data']) : null;
  }
}

class Userdata {
  int? id;
  String? name;
  String? email;
  String? image;
  String? token;

  Userdata.formjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    token = json['token'];
  }
}