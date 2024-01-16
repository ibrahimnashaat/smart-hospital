class DoctorModel {
  String? name;
  String? email;
  bool? liked;
  bool? showInChatPage;

  String? image;
  String? availableAt;
  String? numberOfExperienceYears;
  String? numberOfPatient;
  String? rating;
  String? id;


  String? doctorUid;
  bool? isEmailVerified;


  DoctorModel({
    required this.name,
    required this.email,
    required this.availableAt,
    required this.numberOfExperienceYears,
    required this.numberOfPatient,
    required this.rating,
    required this.liked,
    required this.showInChatPage,

    required this.doctorUid,
    required this.image,
    required this.id,


    required this.isEmailVerified,

  });

  DoctorModel.fromJson(Map<String ,dynamic > json){

    name = json['name'];
    email = json['email'];
    availableAt = json['availableAt'];
    numberOfExperienceYears = json['numberOfExperienceYears'];
    numberOfPatient = json['numberOfPatient'];
    rating = json['rating'];
    liked = json['liked'];
    showInChatPage = json['showInChatPage'];

    doctorUid = json['doctorUid'];
    image = json['image'];
    id = json['id'];


    isEmailVerified = json['isEmailVerified'];

  }

  Map<String, dynamic>  toMap (){

    return {
      'name' : name,
      'email' : email,
      'availableAt' : availableAt,
      'numberOfExperienceYears' : numberOfExperienceYears,
      'numberOfPatient' : numberOfPatient,
      'rating' : rating,
      'liked' : liked,
      'showInChatPage' : showInChatPage,

      'doctorUid' : doctorUid,
      'id':id,

      'isEmailVerified':isEmailVerified,
    };

  }
}
