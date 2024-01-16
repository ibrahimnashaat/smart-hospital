import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/shared/cach_helper/cach_helper.dart';
import 'package:smart_hospital/shared/colors.dart';
import 'package:smart_hospital/layout_pages/layout.dart';
import 'package:smart_hospital/shared/shared.dart';
import 'package:smart_hospital/start/sign_up/states.dart';
import '../../layout_pages/main_home/home_elements/user_profile/user_profile_cubit.dart';
import '../../shared/toast.dart';
import '../login/login.dart';
import 'cubit.dart';


class SignUp extends StatefulWidget{
   SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool termsColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,

      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, Object? state) {

          if (state is RegisterCreateUserSuccessStates) {

              cachHelper.saveData(key: 'uId', value: state.uId);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Layout()),
                      (route) => false);

              UserProfileCubit.get(context).getUserData();


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
                    SizedBox(
                      height: 6.h,
                    ),
                    Text('Join us to start searching',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text('You can find your doctor with the specialty you want',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('and book a medical consultation now!',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
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
                            textEditingController: nameController,
                            text: 'Name',
                            textInputType: TextInputType.name,
                            ifEmpty: 'Please Enter Your Name'
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
                            obscureText: RegisterCubit.get(context).isNotVisible,
                            passwordSuffixIcon: IconButton(
                              onPressed: (){
                                RegisterCubit.get(context).changePasswordVisability();
                              },
                              icon:Icon(RegisterCubit.get(context).suffix,),
                            ),
                            textEditingController: passwordController,
                            text: 'Password',
                            textInputType: TextInputType.visiblePassword,
                            ifEmpty: 'Please Enter Your Password'
                        )
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20,
                          right: 20
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap:(){


                               setState((){
                                 termsColor = ! termsColor;
                               });

                            },
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: termsColor ? mainColor :Colors.grey.withOpacity(0.5),
                            ),

                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                            child: Text(
                              'I agree with the Terms of Service & Privacy Policy',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500

                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ConditionalBuilder(
                        condition: state != RegisterLoadingStates,
                        builder: (BuildContext context) => Container(
                          width: double.infinity,
                          height:MediaQuery.of(context).size.height*0.06,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(15.0),
                                side:
                                BorderSide(color: Colors.white24)),
                            onPressed: () {
                             if(termsColor == true){ if (_formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context,
                                );
                              }} else {
                               showToast(
                                   msg: 'Please agree on the Terms First',
                                   state: ToastStates.WARNING);
                             }
                            },
                            color: mainColor,
                            textColor: Theme.of(context)
                                .scaffoldBackgroundColor,
                            child: Text("Sign up",
                             style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold
                              ),
                          ),),
                        ),
                        fallback: (BuildContext context) =>
                            CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Have an account?',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) => Login()), (route) => false);
                          },
                          child: Text('Log in',
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
          );
        },
      ),
    );
  }
}