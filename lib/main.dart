import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/firebase_options.dart';
import 'package:smart_hospital/shared/cach_helper/cach_helper.dart';
import 'package:smart_hospital/shared/constants.dart';
import 'package:smart_hospital/start/login/cubit.dart';
import 'package:smart_hospital/start/login/login.dart';
import 'package:smart_hospital/start/sign_up/cubit.dart';
import 'package:smart_hospital/start/start_page.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
import 'layout_pages/main_home/home_cubit.dart';
import 'layout_pages/layout.dart';
import 'layout_pages/main_home/home_elements/user_profile/user_profile_cubit.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ZIMKit().init(
    appID: 1621021754, // your appId
    appSign:
        "7d6a1cc37213e3b0067949e2da9d6a6ab9a78d354d61f25a91d85b51d589e483", // your appSign
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

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserProfileCubit()
            ..getUserData()
            ..getDoctorData()
            ..getAllDoctors(),
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

      child: Sizer(builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ))),
          home: startWidget,
        );
      }),
    );
  }
}

// "phoneNumberRequired": true
