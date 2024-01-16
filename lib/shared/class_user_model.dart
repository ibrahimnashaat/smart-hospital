class UserModel {
   String? name;
   String? email;

   String? image;


   String? uId;
   bool? isEmailVerified;


  UserModel({
    required this.name,
    required this.email,

    required this.uId,
    required this.image,


    required this.isEmailVerified,

  });

  UserModel.fromJson(Map<String ,dynamic > json){

    name = json['name'];
    email = json['email'];

    uId = json['uId'];
    image = json['image'];


    isEmailVerified = json['isEmailVerified'];

  }

  Map<String, dynamic>  toMap (){

    return {
      'name' : name,
      'email' : email,

      'uId' : uId,
      'image':image,

      'isEmailVerified':isEmailVerified,
    };

  }
}
