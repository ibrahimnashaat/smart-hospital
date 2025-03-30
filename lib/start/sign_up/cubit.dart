import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_hospital/shared/class_user_model.dart';
import 'package:smart_hospital/start/sign_up/states.dart';

import '../login/login_model.dart';





class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);








  void createUser (
      {
        required String name,
        required String email,
        required String uId,

      }
      ){


    UserModel model = UserModel(
      name : name,

      email:email,

      uId:uId,
      isEmailVerified: false,
      image : 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1662406827~exp=1662407427~hmac=f4e97a981b226aaed69a3eff8d2b1366a943f5ab21a48c33ded209f42068dce5',


    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {

      print('شغال');
      emit(RegisterCreateUserSuccessStates(uId: uId));
    }).catchError((error){
      print ('مش شغال');
      emit(RegisterCreateUserErrorStates(error.toString()));
    });

  }


  void userRegister({
    required String name,
    required String email,
    required String password,
    required BuildContext context,


  }) {
    emit(RegisterLoadingStates());
    showDialog(
      context: context,
      builder:(context){
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,).then((value){
      print(value.user!.email);
      print(value.user!.uid);

      print('انت كدا تمام من ناحية ادخال البيانات');

      createUser(
        name : name,
        email:email,
        uId:value.user!.uid,

      );
      emit(RegisterSuccessStates());

    }).catchError((error){
      emit(RegisterErrorStates(error.toString()));
    });
  }



  IconData suffix = Icons.visibility_off;
  bool isNotVisible = true;

  void changePasswordVisability() {
    isNotVisible = !isNotVisible;

    suffix = isNotVisible ? Icons.visibility_off : Icons.visibility;
    emit(PasswordStates());
  }
}