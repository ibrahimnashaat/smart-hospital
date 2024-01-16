import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:smart_hospital/shared/cach_helper/cach_helper.dart';
import 'package:smart_hospital/shared/colors.dart';

import '../main_home/home_cubit.dart';
import '../main_home/home_elements/user_profile/doctor_model.dart';
import '../main_home/home_elements/user_profile/user_profile_cubit.dart';
import '../main_home/home_elements/user_profile/user_profile_states.dart';


class Likes extends StatefulWidget{
  Likes({super.key});

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileStates>(
      listener: (context,state){},
      builder: (context,state){

        List<DoctorModel> filteredDoctors = UserProfileCubit.get(context)
            .doctors
            .where((doctor) =>
            doctor.name!.toLowerCase().contains(searchController.text.toLowerCase()))
            .toList();

        return Scaffold(
          backgroundColor: secondaryColor,
          appBar: AppBar(

            title: Center(
              child: Text(
                'Likes',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: mainColor
                ),

              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,

              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width:MediaQuery.of(context).size.width*0.05 ,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        height:MediaQuery.of(context).size.height*0.08 ,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child:TextFormField(
                          keyboardType: TextInputType.text,


                          controller: searchController,



                          decoration: InputDecoration(
                            filled: true,
                            fillColor: secondaryColor,


                            hintStyle: TextStyle(

                                color: Colors.grey
                            ),
                            focusColor: Colors.white,
                            focusedBorder:OutlineInputBorder(

                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),

                            ),
                            focusedErrorBorder:OutlineInputBorder(

                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),

                            ),
                            disabledBorder: OutlineInputBorder (

                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),

                            ),
                            enabledBorder: OutlineInputBorder(

                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),

                              ),

                            ),




                          ),


                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        height:MediaQuery.of(context).size.height*0.08 ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: mainColor,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextButton(
                           onPressed:  (){
                             setState((){
                               filteredDoctors = UserProfileCubit.get(context)
                                   .doctors
                                   .where((doctor) =>
                                   doctor.name!.toLowerCase().contains(searchController.text.toLowerCase()))
                                   .toList();
                             });
                           },
                          child: Text('Search',
                          style: TextStyle(
                            color: secondaryColor
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),




                  ConditionalBuilder(
                    condition:filteredDoctors.isNotEmpty,
                    builder:(context)=> ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context,index)=> mainWidgetInThisPage(
                        context: context,
                        model: filteredDoctors[index],
                        index: index

                      ),

                      itemCount: filteredDoctors.length  ,

                      physics: BouncingScrollPhysics(),
                    ),
                    fallback: (context)=> Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),






                ],
              ),
            ),
          ),

        );
      },
    );
  }
}

Widget mainWidgetInThisPage (
    {
      required BuildContext context,
      required DoctorModel model,
      required int index,

    }
    ) => model.liked ==true ? Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    padding: EdgeInsets.all(20),
    width: double.infinity,
    height: MediaQuery.of(context).size.height*0.265,
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(20),

      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 6,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),

    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.22,
              height: MediaQuery.of(context).size.width*0.22,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(model.image??'',

                    ),
                  )
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width*0.22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name??'',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Text('Tooths Dentist',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(model.numberOfExperienceYears??'',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(

                        children: [
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: mainColor,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(model.rating??'',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: mainColor,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(model.numberOfPatient??'',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ],
              ),
            ),
            IconButton(onPressed: (){
              if (model.liked != null) {
                model.liked = !model.liked!;
              }
              UserProfileCubit.get(context).changeDoctorLike(
                model: model,
                liked: model.liked,
              );

            }, icon: Icon(
              Icons.favorite,
              color: model.liked == true ? Colors.red : Colors.grey,
            )),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('Next Available',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Text(model.availableAt??'',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Text('AM tomorrow',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: (){
                       if (index == 0) {
                         cachHelper.saveData(key: 'doctor1', value: 0);
                       }else if (index == 1){
                      cachHelper.saveData(key: 'doctor2', value: 1);}
                       else {
                         cachHelper.saveData(key: 'doctor3', value: 2);
                       }
                      // UserProfileCubit.get(context).changeShowInChatPage(
                      //   model: model,
                      //   showInChatPage: true,
                      // );
                      HomeCubit.get(context).changeBottomNavBar(2);




                    },
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color?>(mainColor),
                    ),
                    child: Text('Book Now',
                      style: TextStyle(
                          color: secondaryColor
                      ),
                    ))
              ],
            ),
          ),
        ),
      ],
    ),
  ),
) :  Container();