import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/shared/cach_helper/cach_helper.dart';

import 'package:smart_hospital/shared/colors.dart';

import '../../../layout.dart';
import '../../home_cubit.dart';


class HomeService extends StatelessWidget{
  const HomeService({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(
            Icons.arrow_back_ios_rounded,
            color: mainColor,
          ),onPressed: (){
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context)=>Layout()), (route) => false
          );
        },),
        centerTitle: true,
        title: Text(
          'Home Services',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: mainColor
          ),

        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              mainWidgetInThisPage(
                context: context,
                title: 'Medical Care',
                function: (){}
              ),
              mainWidgetInThisPage(
                  context: context,
                  title: 'Injection',
                  function: (){}
              ),
              mainWidgetInThisPage(
                  context: context,
                  title: 'Burn Injuries',
                  function: (){}
              ),
              mainWidgetInThisPage(
                  context: context,
                  title: 'Blood pressure',
                  function: (){}
              ),
              mainWidgetInThisPage(
                  context: context,
                  title: 'Burn Injuries',
                  function: (){}
              ),
              mainWidgetInThisPage(
                  context: context,
                  title: 'Diabetes',
                  function: (){}
              ),
              mainWidgetInThisPage(
                  context: context,
                  title: 'Unconsciousness',
                  function: (){}
              ),





            ],
          ),
        ),
      ),

    );
  }

}



Widget mainWidgetInThisPage (
{
  required BuildContext context,
  required String title,
  required Function function,
}
    ) => Padding(
  padding: const EdgeInsets.all(20),
  child: InkWell(
    onTap: (){


      cachHelper.saveData(key: 'doctor4', value: 3);

      HomeCubit.get(context).changeBottomNavBar(3);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Layout()), (route) => false);

      print('clicked');
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child:Container(
        width: double.infinity,
        height:MediaQuery.of(context).size.height*0.06,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(15.0),
              side:
              BorderSide(color: Colors.white24)),
          onPressed:function(),
          color: mainColor,
          textColor: Theme.of(context)
              .scaffoldBackgroundColor,
          child: Text(title ?? '',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold
            ),
          ),),
      ),
    ),
  ),
);
