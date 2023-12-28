import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/cach_helper/cach_helper.dart';
import 'package:smart_hospital/colors.dart';
import 'package:smart_hospital/layout_pages/layout.dart';
import 'package:smart_hospital/login/cubit.dart';
import 'package:smart_hospital/login/states.dart';

import 'package:smart_hospital/shared/shared.dart';
import 'package:smart_hospital/shared/toast.dart';
import 'package:smart_hospital/sign_up/sign_up.dart';
import 'package:smart_hospital/user_profile/user_profile_cubit.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../class_user_model.dart';
import '../user_profile/doctor_model.dart';

class Login extends StatefulWidget{
   const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool termsColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,

      body: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context,  state) {
          if (state is LoginLoadingStates) {

            showToast(
                msg: 'Check the network connection',
                state: ToastStates.WARNING);


            // cachHelper.saveData(key: 'token', value: false);
          }
          else if (state is LoginSuccessStates) {

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>Layout()),
                    (route) => false);
              cachHelper.saveData(key: 'uId', value: state.uId).then((value) async {
                final uId = FirebaseAuth.instance.currentUser?.uid;
                if(
                uId == "TT12nbU3WZV9nSUPBwUDXH8mmXJ2" ||
                uId == "7v0UNsO4rrSfrf0POzqm1YF7Mo83" ||
                uId == "m5EbPhM4IAOcFN9GdiMwwLABU7q2" ||
                uId == "zXree2DBHZV0Nd6cnUWhyyG3UHu2" ||
                uId == "oVhPBjNuSCWBGnlOGjfXc04lPHx2" ||
                uId == "mM9UopgU2dWHvcKVLNrlPB4ujj93"
                )
                {



                  UserProfileCubit.get(context).getDoctorData();
                  DoctorModel? doctorModel;

                  FirebaseFirestore.instance
                      .collection('doctors')
                      .doc(uId)
                      .get()
                      .then((value) async {
                    doctorModel = DoctorModel.fromJson(value.data()!);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) =>  Layout()),
                            (route) => false);
                    }).catchError((e) {
                    print(e.toString());
                  });
                }else{
                  UserProfileCubit.get(context).getUserData();
                  UserModel? userModel;
                  final uId = FirebaseAuth.instance.currentUser?.uid;
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(uId)
                      .get()
                      .then((value) {
                    userModel = UserModel.fromJson(value.data()!);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Layout()),
                            (route) => false);

                  }).catchError((e) {
                    print(e.toString());
                  });
                }
              }).catchError((error) {
                print(error.toString());
              });



          }
          else{
            showToast(
                msg: 'Check Your Email or Password',
                state: ToastStates.ERORR);
          }


        },
        builder: (BuildContext context, state) {
          return Center(
            child: Form(
              key:_formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('Welcome back',
                      style: TextStyle(
                        fontSize: 26.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),



                    SizedBox(height: 10.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(

                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.08,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15),),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 2,
                                blurRadius:2,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],

                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/images/google_icon.png',
                                width: 8.w,
                                height: 8.h,
                              ),
                              Text('Google',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),





                        ),
                        Container(

                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.08,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15),),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 2,
                                blurRadius:2,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],

                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/images/facebook_icon.png',
                                width: 8.w,
                                height: 8.h,
                              ),
                              Text('Facebook',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),



                        ),

                      ],
                    ),

                    SizedBox(
                      height: 6.h,
                    ),


                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20,
                            right: 20
                        ),
                        child: textFormField(
                            obscureText: false,

                            textEditingController: emailController ,
                            text: 'Email',
                            textInputType: TextInputType.emailAddress,
                            ifEmpty: 'Please Enter Your Email'
                        )
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20,
                            right: 20
                        ),
                        child: textFormField(
                            obscureText: LoginCubit.get(context).isNotVisible,
                            passwordSuffixIcon: IconButton(
                              onPressed: (){
                                LoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              icon: Icon(LoginCubit.get(context).suffix,),
                            ),
                            textEditingController: passwordController,
                            text: 'Password',
                            textInputType: TextInputType.visiblePassword,
                            ifEmpty: 'Please Enter Your Password'
                        )
                    ),
                    SizedBox(
                      height: 4.h,
                    ),


                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30,
                              right: 30
                          ),
                          child:ConditionalBuilder(
                            condition: state != LoginLoadingStates,
                            builder: (BuildContext context) => Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height*0.06,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.white24)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      context: context,
                                    );
                                  }
                                },
                                color: mainColor,
                                textColor:
                                Theme.of(context).scaffoldBackgroundColor,
                                child: Text("Login",
                                    style: TextStyle(
                                        color: secondaryColor ,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold
                                    ),),
                              ),
                            ),
                            fallback: (BuildContext context) =>
                                CircularProgressIndicator(),
                          ),
                        ),
                        TextButton(onPressed: (){}, child: Text('Forgot password',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        TextButton(
                          onPressed: (){

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                                    (route) => false);

                          },
                          child: Text('Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          ) ;
        },
      ),
    );
  }
}