import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_hospital/start/login/states.dart';

import 'login_model.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(): super(LoginInitialStates());
  static LoginCubit get(context) => BlocProvider.of(context);



  LoginModel? loginModel;

  void userLogin(
      {
        required String email,
        required String password,
        required BuildContext context,
      }
      ){
    emit(LoginLoadingStates());
    showDialog(
      context: context,
      builder:(context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,).then((value) {
      emit(LoginSuccessStates(
          uId : value.user!.uid));
      print('Success');
      print(value.user!.email);
      print(value.user!.uid);
    }).catchError((error){
      emit(LoginErrorStates(error.toString()));
    });


  }






  IconData suffix =Icons.visibility_off_outlined;
  bool isNotVisible = true;

  void changePasswordVisibility(){

    isNotVisible = !isNotVisible ;

    suffix = isNotVisible ? Icons.visibility_off_outlined: Icons.visibility_outlined;
    emit(PasswordStates());

  }

}

