import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';
import 'package:smart_hospital/cach_helper/cach_helper.dart';
import 'package:smart_hospital/firebase_options.dart';
import 'package:smart_hospital/layout_pages/Likes/Likes.dart';
import 'package:smart_hospital/shared/constants.dart';
import 'package:smart_hospital/sign_up/cubit.dart';
import 'package:smart_hospital/start_page.dart';
import 'package:smart_hospital/user_profile/user_profile_cubit.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
import 'layout_pages/home_cubit.dart';
import 'layout_pages/layout.dart';
import 'layout_pages/payment/booking_details.dart';
import 'login/cubit.dart';
import 'login/login.dart';


main() async{

   WidgetsFlutterBinding.ensureInitialized();
   
   await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
   );

   ZIMKit().init(
     appID: 644993975, // your appId
     appSign: "2920bfd28b6fade468e6871e30a4d86950d6f9b82e5123f7b4db3d82355e2b4d", // your appSign
   );

   await cachHelper.init();


   Widget widget;

   var startPage = cachHelper.getData(key: 'startPage');
   uId = cachHelper.getData(key: 'uId');


   if (uId != null) {

        widget = Layout();

   } else {
     if (startPage != null) {
       widget = Login();
     } else {
       widget = StartPage();
     }
   }

  runApp( MyApp(
    startWidget: widget,
  ));

}

class MyApp extends StatelessWidget{

  final Widget startWidget;
  MyApp({

    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
      return  MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserProfileCubit()..getUserData()..getDoctorData()..getAllDoctors(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),

        ],

        /// dark & light

        child: Sizer(

            builder: (BuildContext context, Orientation orientation, DeviceType deviceType)
            {
              return MaterialApp(
                debugShowCheckedModeBanner: false,

                theme: ThemeData(
                    appBarTheme: AppBarTheme(
                        systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: Brightness.light,

                        )
                    )
                ),

                home:startWidget,
              );
            }
        ),


      );
      }
}



// "phoneNumberRequired": true