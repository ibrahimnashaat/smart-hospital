import 'dart:io';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_hospital/user_profile/user_profile_states.dart';
import '../class_user_model.dart';


import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'doctor_model.dart';

class UserProfileCubit extends Cubit<UserProfileStates> {
  UserProfileCubit() : super(UserProfileInitialStates());

  ///translation2

  static UserProfileCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;

  UserModel? userModel;

  void getUserData() {
    emit(UserProfileGetUserLoadingStates());
    final uId = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      print(userModel!.uId);
      emit(UserProfileGetUserSuccessStates());
    }).catchError((e) {
      emit(UserProfileGetUserErrorStates());
    });
  }
  DoctorModel? doctorModel;

  void getDoctorData() {
    emit(DoctorProfileGetDoctorLoadingStates());
    final doctorUid = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance.collection('doctors').doc(doctorUid).get().then((
        value) {
      doctorModel = DoctorModel.fromJson(value.data()!);
      print(doctorModel!.doctorUid);
      emit(DoctorProfileGetDoctorSuccessStates());
    }).catchError((e) {
      emit(DoctorProfileGetDoctorErrorStates());
    });
  }


  File? ProfileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      ProfileImage = File(pickedFile.path);
      emit(UserProfileImagePeckerSuccessStates());
    } else {
      print('No Image Selected!');
      emit(UserProfileImagePeckerErrorStates());
    }
  }



  void upLoudProfilImage({
    required String name,
    required String email,

  }) {
    emit(UserProfileUserUpdateLoadingStates());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("users/${Uri.file(ProfileImage!.path).pathSegments.last}")
        .putFile(ProfileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(

          name: name,

          email: email,


          image: value,
        );

        //emit(SocialUpLoudProfileImageSuccessStates());
      }).catchError((e) {
        emit(UserProfileUpLoudProfileImageErrorStates());
      });
    }).catchError((e) {
      emit(UserProfileUpLoudProfileImageErrorStates());
    });
  }





  void updateUser({
    required String name,

    required String email,



    String? image,

  }) {
    UserModel model = UserModel(

      name: name,

      email: email,
      image: image ?? userModel?.image,
      uId: userModel?.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((e) {
      emit(UserProfileUserUpdateErrorStates());
    });
  }




 List<DoctorModel> doctors = [];


  void getAllDoctors(){
    doctors = [];
    FirebaseFirestore.instance.collection('doctors').get().then((value) {
      value.docs.forEach((element) { 
        doctors.add(DoctorModel.fromJson(element.data()));
      });
      emit(DoctorProfileGetAllDoctorSuccessStates());
    } ).catchError((error){
      print(error.toString());
      emit(DoctorProfileGetAllDoctorErrorStates());
    });
  }


 bool isLiked = true;

  void changeDoctorLike (
  {
    required var model,
    required var liked,


}
      ){
      isLiked = liked;


    FirebaseFirestore.instance.collection('doctors').doc(model.doctorUid).update({
      'liked' :liked
    }).then((value) {
      getAllDoctors();
      emit(DoctorShowInChatPageSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(DoctorShowInChatPageErrorStates());
    });



  }









  void changeShowInChatPage (
      {
        required var model,
        required var showInChatPage,


      }
      ){



    FirebaseFirestore.instance.collection('doctors').doc(model.doctorUid).update({
      'showInChatPage' :showInChatPage
    }).then((value) {
      getAllDoctors();
      emit(DoctorLikedSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(DoctorLikedErrorStates());
    });



  }





  void changeShowInChatPage2 (
      {
        required String model,
        required bool showInChatPage,


      }
      ){



    FirebaseFirestore.instance.collection('doctors').doc(model).update({
      'showInChatPage' :showInChatPage
    }).then((value) {
      getAllDoctors();
      emit(DoctorLikedSuccessStates2());
    }).catchError((error){
      print(error.toString());
      emit(DoctorLikedErrorStates2());
    });



  }









}


