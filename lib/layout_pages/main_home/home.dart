import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/colors.dart';
import 'package:smart_hospital/home_services/home_service.dart';
import 'package:smart_hospital/layout_pages/Likes/Likes.dart';
import 'package:smart_hospital/pharmacy/pharmacy.dart';
import 'package:smart_hospital/shared/shared.dart';
import 'package:smart_hospital/user_profile/user_profile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../find_doctors/find_doctors.dart';
import '../../tests_and_x-rays/medical_tests_and_x-rays.dart';
import '../../user_profile/user_profile_cubit.dart';
import '../../user_profile/user_profile_states.dart';
import 'full.dart';


class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        listener: (context,state){},

      builder: (context,state){

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

          profileImage = UserProfileCubit.get(context).ProfileImage;
        }else{
          model = UserProfileCubit.get(context).userModel;
          image = model?.image;

          profileImage = UserProfileCubit.get(context).ProfileImage;

        }

          return Scaffold(

            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.25,

                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height*0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                ),
                                color: mainColor,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height*0.05,

                            ),
                          ],
                        ),
                        SafeArea(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.25,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Hi Handwerker!',
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    Expanded(
                                      child: Text('Find Your Doctor',
                                        style: TextStyle(
                                            color: secondaryColor,
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),

                                  ],

                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context)=>UserProfile()), (route) => false
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 34,
                                    backgroundColor: secondaryColor,
                                    backgroundImage: profileImage == null ? NetworkImage('$image') : FileImage(profileImage) as ImageProvider,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 30,
                              left: 30
                          ),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),


                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(color: Colors.white24)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  FindDoctors()),
                                        );
                              },
                              color: secondaryColor,
                              textColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              child: Row(
                                children: [
                                  Icon(Icons.search,
                                  color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text("Search",
                                    style: TextStyle(
                                        color: Colors.grey ,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500
                                    ),),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Live Doctors',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,

                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.3,
                              height:MediaQuery.of(context).size.height*0.22,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.all(Radius.circular(15)),

                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [

                                  Image(image: AssetImage('assets/images/live1.png')),
                                  IconButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>MyYoutubePlayer(
                                      url: "https://www.youtube.com/watch?v=GdDaTicfgyY",
                                    ), ));
                                  }, icon: Icon(
                                    Icons.not_started_outlined,
                                    size: 60,
                                    color: Colors.white.withOpacity(0),
                                  )),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.3,
                              height:MediaQuery.of(context).size.height*0.22,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [

                                  Image(image: AssetImage('assets/images/live2.png')),
                                  IconButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>MyYoutubePlayer(
                                      url: "https://www.youtube.com/watch?v=cYFn0R9147Q",
                                    ), ));
                                  }, icon: Icon(
                                    Icons.not_started_outlined,
                                    size: 60,
                                    color: Colors.white.withOpacity(0),
                                  )),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.3,
                              height:MediaQuery.of(context).size.height*0.22,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.all(Radius.circular(15)),

                              ),
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [

                                  Image(image: AssetImage('assets/images/live3.png')),
                                  IconButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>MyYoutubePlayer(
                                      url: "https://www.youtube.com/watch?v=lw7xIB0kPCo",
                                    ), ));
                                  }, icon: Icon(
                                      Icons.not_started_outlined,
                                    size: 60,
                                    color: Colors.white.withOpacity(0),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Specialties',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,

                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.2,
                              height: MediaQuery.of(context).size.width*0.24,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.asset('assets/images/page1.png'),

                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.2,
                              height: MediaQuery.of(context).size.width*0.24,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.asset('assets/images/page2.png'),

                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.2,
                              height: MediaQuery.of(context).size.width*0.24,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.asset('assets/images/page3.png'),

                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.2,
                              height: MediaQuery.of(context).size.width*0.24,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.asset('assets/images/page1.png'),

                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20,
                        right: 20
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),

                        Container(
                          width: double.infinity,
                          height:MediaQuery.of(context).size.height*0.06,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(15.0),
                                side:
                                BorderSide(color: Colors.white24)),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context)=>HomeService()), (route) => false
                              );
                            },
                            color: mainColor,
                            textColor: Theme.of(context)
                                .scaffoldBackgroundColor,
                            child: Text("Home Service",
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: double.infinity,
                          height:MediaQuery.of(context).size.height*0.06,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(15.0),
                                side:
                                BorderSide(color: Colors.white24)),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context)=>Pharmacy()), (route) => false
                              );
                            },
                            color: mainColor,
                            textColor: Theme.of(context)
                                .scaffoldBackgroundColor,
                            child: Text("Pharmacy",
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: double.infinity,
                          height:MediaQuery.of(context).size.height*0.06,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(15.0),
                                side:
                                BorderSide(color: Colors.white24)),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context)=>XRaysPage()), (route) => false
                              );
                            },
                            color: mainColor,
                            textColor: Theme.of(context)
                                .scaffoldBackgroundColor,
                            child: Text("Medical tests and x-rays",
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
      },
        );
  }
}