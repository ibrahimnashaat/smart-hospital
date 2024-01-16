import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/shared/colors.dart';

import 'main_home/home_cubit.dart';
import 'main_home/home_elements/user_profile/user_profile_cubit.dart';
import 'main_home/home_elements/user_profile/user_profile_states.dart';
import 'main_home/home_states.dart';



class Layout extends StatefulWidget{
  Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
         listener: (context,state){},
          builder:(context,state){
            var cubit = HomeCubit.get(context);
           return Scaffold(
             backgroundColor: secondaryColor,
             body: cubit.screens[cubit.currentIndex],
             bottomNavigationBar: BottomNavigationBar(
               currentIndex:cubit.currentIndex ,
               onTap: (index) {
                 cubit.changeBottomNavBar(index);
               },
               fixedColor: mainColor,
               items:  [
                 BottomNavigationBarItem(
                     icon: cubit.currentIndex == 0 ? CircleAvatar(
                         backgroundColor: Colors.blueAccent,
                         radius: 26,
                         child:Icon(
                           Icons.home,
                           color: Colors.white,
                           size: 34,
                         ) ) :Icon(
                       Icons.home,
                       color: Colors.grey,
                       size: 34,
                     ) ,
                     label: ''
                 ),
                 BottomNavigationBarItem(
                     icon: cubit.currentIndex == 1 ? CircleAvatar(
                         backgroundColor: Colors.blueAccent,
                         radius: 26,
                         child:Icon(
                           Icons.favorite,
                           color: Colors.white,
                           size: 34,
                         ) ) :Icon(
                       Icons.favorite,
                       color: Colors.grey,
                       size: 34,
                     ) ,
                     label: ''
                 ),
                 BottomNavigationBarItem(
                     icon: cubit.currentIndex == 2 ? CircleAvatar(
                       backgroundColor: Colors.blueAccent,
                       radius: 26,
                       child:Image(

                         image: AssetImage(
                           'assets/images/open-book.png',

                         ),
                         color: secondaryColor,
                         width: 8.w ,
                         height: 4.h,
                       ),
                     ) :Image(

                       image: AssetImage(
                         'assets/images/open-book.png',

                       ),
                       color: Colors.grey,
                       width: 8.w ,
                       height: 4.h,
                     ),
                     label: ''
                 ),
                 BottomNavigationBarItem(
                     icon:cubit.currentIndex == 3 ? BlocConsumer<UserProfileCubit,UserProfileStates>(
                      listener: (context,state){},
                      builder: (context,state){
                        return InkWell(
                          onTap: ()async {
                            UserProfileCubit.get(context).getAllDoctors();

                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 26,
                            child:Image(

                              image: AssetImage(
                                'assets/images/chat.png',

                              ),
                              color: secondaryColor,
                              width: 8.w ,
                              height: 4.h,
                            ),
                          ),
                        );
                      },
                     ) :Image(

                       image: AssetImage(
                         'assets/images/chat.png',

                       ),
                       color: Colors.grey,
                       width: 8.w ,
                       height: 4.h,
                     ),
                     label: ''
                 ),
               ],
             ),


           );

          },
    );
  }
}