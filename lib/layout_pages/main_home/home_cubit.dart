
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/layout_pages/Likes/Likes.dart';
import 'package:smart_hospital/layout_pages/main_home/home.dart';
import 'package:smart_hospital/layout_pages/payment/booking_details.dart';

import '../chat_text_message/message/message.dart';
import 'home_states.dart';



class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;





  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(HomeBottomNavState());
  }



  List<Widget> screens = [
    Home(),
    Likes(),
    BookingDetails(),
    Message(),
  ];
}
