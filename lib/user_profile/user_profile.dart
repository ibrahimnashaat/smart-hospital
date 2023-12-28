import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/cach_helper/cach_helper.dart';
import 'package:smart_hospital/colors.dart';
import 'package:smart_hospital/layout_pages/layout.dart';
import 'package:smart_hospital/user_profile/user_profile_cubit.dart';
import 'package:smart_hospital/user_profile/user_profile_states.dart';

import '../login/login.dart';

class UserProfile extends StatelessWidget {
   UserProfile({Key? key}) : super(key: key);

  var nameController = TextEditingController();

  var bioController = TextEditingController();

  var phoneController = TextEditingController();

  var emailController = TextEditingController();

  var ageController = TextEditingController();

  var addressController = TextEditingController();

  String? type ;

  String? typeMember ;
   final uId = FirebaseAuth.instance.currentUser?.uid;

   // ignore: prefer_typing_uninitialized_variables
   late var model;
   // ignore: prefer_typing_uninitialized_variables
   late var image;
   // ignore: prefer_typing_uninitialized_variables
   late var profileImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {

        if(
        uId == "TT12nbU3WZV9nSUPBwUDXH8mmXJ2" ||
            uId == "7v0UNsO4rrSfrf0POzqm1YF7Mo83" ||
            uId == "m5EbPhM4IAOcFN9GdiMwwLABU7q2" ||
            uId == "zXree2DBHZV0Nd6cnUWhyyG3UHu2" ||
            uId == "oVhPBjNuSCWBGnlOGjfXc04lPHx2" ||
            uId == "mM9UopgU2dWHvcKVLNrlPB4ujj93"
        )    {
           model = UserProfileCubit.get(context).doctorModel;
           image = model?.image;
          nameController.text = model?.name ?? 'loading..';
          emailController.text = model?.email ?? 'loading..';
           profileImage = UserProfileCubit.get(context).ProfileImage;
        }else{
           model = UserProfileCubit.get(context).userModel;
           image = model?.image;
          nameController.text = model?.name ?? 'loading..';
          emailController.text = model?.email ?? 'loading..';
           profileImage = UserProfileCubit.get(context).ProfileImage;

        }



        return Scaffold(
          appBar: AppBar(
           backgroundColor: mainColor,
            leading: IconButton(
              icon:Icon(
                Icons.arrow_back_ios_rounded,
            color: secondaryColor,
            ),onPressed: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context)=>Layout()), (route) => false
              );
            },),
            actions: [

          uId == "TT12nbU3WZV9nSUPBwUDXH8mmXJ2" ||
          uId == "7v0UNsO4rrSfrf0POzqm1YF7Mo83" ||
          uId == "m5EbPhM4IAOcFN9GdiMwwLABU7q2" ||
          uId == "zXree2DBHZV0Nd6cnUWhyyG3UHu2" ||
          uId == "oVhPBjNuSCWBGnlOGjfXc04lPHx2" ||
          uId == "mM9UopgU2dWHvcKVLNrlPB4ujj93"
             ? Container() : TextButton(
                onPressed: () {
                  UserProfileCubit.get(
                      context).updateUser(
                    name: nameController.text,

                    email: emailController.text,

                  );
                },
                child: SizedBox(
                  width:18.w,
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: secondaryColor
                    ),
                  ),
                ),

              ) ,

            ],
          ),
          body: SingleChildScrollView(
            child: Column(

              children: [
                Container(
                  width: double.infinity,
                      color: mainColor,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [




                      Column(

                        children: [

                          Text('Set up your profile',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: secondaryColor
                            ),

                          ),
                          Text('Update your profile to connect your doctor with',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: secondaryColor
                            ),
                          ),
                          Text('better impression',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: secondaryColor
                            ),
                          ),
                          SizedBox(
                           height : 2.h,
                          ),

                          Stack(
                            alignment: AlignmentDirectional.bottomCenter,

                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 76,
                                  backgroundColor: Colors.black12,
                                  backgroundImage:profileImage == null ? NetworkImage('$image') : FileImage(profileImage) as ImageProvider,
                                ),
                              ),

                uId == "TT12nbU3WZV9nSUPBwUDXH8mmXJ2" ||
                uId == "7v0UNsO4rrSfrf0POzqm1YF7Mo83" ||
                uId == "m5EbPhM4IAOcFN9GdiMwwLABU7q2" ||
                uId == "zXree2DBHZV0Nd6cnUWhyyG3UHu2" ||
                uId == "oVhPBjNuSCWBGnlOGjfXc04lPHx2" ||
                    uId == "mM9UopgU2dWHvcKVLNrlPB4ujj93"
                   ? Container() :   IconButton(
                                  onPressed: (){
                                    UserProfileCubit.get(context).getProfileImage();
                                  },
                                  icon:CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ],
                          ),
                          SizedBox(
                            height : 3.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 2.h,
                ),

                Text(
                  '${model?.name??'loading..'}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: mainColor
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                if (UserProfileCubit.get(context).ProfileImage != null )
                  Row(
                    children: [





                      SizedBox(
                        width: 2.w,
                      ),
                      if(UserProfileCubit.get(context).ProfileImage != null)

                        Expanded(
                          child:  Column(
                            children: [
                              if(state is UserProfileImagePeckerSuccessStates)
                              OutlinedButton(
                                onPressed: (){
                                  UserProfileCubit.get(context).upLoudProfilImage(
                                    name: nameController.text,

                                    email: emailController.text,);

                                },
                                child: Text(
                                    "Update Image"

                                ),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(100, 50),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              if(state is UserProfileUserUpdateLoadingStates)
                                SizedBox(
                                  height: 1.h,
                                ),
                              if(state is UserProfileUserUpdateLoadingStates)
                                LinearProgressIndicator(),
                            ],
                          ),
                        ),


                    ],
                  ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text(
                          "User Name"),
                      prefixIcon: Icon(

                        Icons.person,
                      ),
                    ),
                  ),
                ),




                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text(
                          "e-mail"),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                    ),
                  ),
                ),
                Row(

                  children: [
                    Icon(
                      Icons.logout,
                      color: mainColor,
                    ),
                    TextButton(
                      onPressed: (){
                        cachHelper.removeData('uId').then((value) {
                          if (value ){
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context)=>Login()), (route) => false
                            );
                          }
                        });
                      },
                      child: Text(
                        "logout",
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,

                        ),
                      ),

                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
