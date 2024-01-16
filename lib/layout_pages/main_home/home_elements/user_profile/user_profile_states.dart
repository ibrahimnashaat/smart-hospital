abstract class UserProfileStates{}
class UserProfileInitialStates extends UserProfileStates{}
class UserProfileGetUserLoadingStates extends UserProfileStates{}
class UserProfileGetUserSuccessStates extends UserProfileStates{}
class UserProfileGetUserErrorStates extends UserProfileStates {}





class DoctorProfileGetDoctorLoadingStates extends UserProfileStates{}
class DoctorProfileGetDoctorSuccessStates extends UserProfileStates{}
class DoctorProfileGetDoctorErrorStates extends UserProfileStates {}

class DoctorProfileGetAllDoctorLoadingStates extends UserProfileStates{}
class DoctorProfileGetAllDoctorSuccessStates extends UserProfileStates{}
class DoctorProfileGetAllDoctorErrorStates extends UserProfileStates {}

class DoctorLikedLoadingStates extends UserProfileStates{}
class DoctorLikedSuccessStates extends UserProfileStates{}
class DoctorLikedErrorStates extends UserProfileStates {}



class DoctorLikedLoadingStates2 extends UserProfileStates{}
class DoctorLikedSuccessStates2 extends UserProfileStates{}
class DoctorLikedErrorStates2 extends UserProfileStates {}



class DoctorShowInChatPageLoadingStates extends UserProfileStates{}
class DoctorShowInChatPageSuccessStates extends UserProfileStates{}
class DoctorShowInChatPageErrorStates extends UserProfileStates {}


class ChangBouttomNavStute extends  UserProfileStates{}
class UserProfileNewPostStates extends  UserProfileStates{}
//
class UserProfileImagePeckerSuccessStates extends  UserProfileStates{}
class UserProfileImagePeckerErrorStates extends UserProfileStates{}


//
class UserProfileCoverPeckerSuccessStates extends  UserProfileStates{}
class UserProfileCoverPeckerErrorStates extends  UserProfileStates{}

//
class UserProfileUpLoudProfileImageSuccessStates extends  UserProfileStates{}
class UserProfileUpLoudProfileImageErrorStates extends UserProfileStates{}
//


class UserProfileUpLoudProfileCoverSuccessStates extends  UserProfileStates{}
class UserProfileUpLoudProfileCoverErrorStates extends  UserProfileStates{}
class UserProfileUserUpdateErrorStates extends  UserProfileStates{}

class UserProfileUserUpdateLoadingStates extends  UserProfileStates{}








class RegisterLoadingStates extends UserProfileStates {}

class RegisterSuccessStates extends UserProfileStates {}

class RegisterErrorStates extends UserProfileStates{
  late final String error;
  RegisterErrorStates(this.error);
}

class RegisterCreateUserSuccessStates extends UserProfileStates {

  late String uId;
  RegisterCreateUserSuccessStates ({required this.uId});
}

class RegisterCreateUserErrorStates extends UserProfileStates {
  late final String error;
  RegisterCreateUserErrorStates(this.error);
}

class PasswordStates extends UserProfileStates {}



