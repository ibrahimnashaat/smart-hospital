import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/cach_helper/cach_helper.dart';
import 'package:smart_hospital/colors.dart';

import '../../shared/shared.dart';
import '../layout_pages/home_cubit.dart';
import '../layout_pages/layout.dart';
import '../user_profile/user_profile_cubit.dart';

class XRaysPage extends StatelessWidget{
  const XRaysPage({super.key});



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
          'Medical tests and x-rays',
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
              Padding(
                padding: const EdgeInsets.only(
                    right: 20,
                    left: 20
                ),
                child: Container(
                  decoration: BoxDecoration(
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
                  child: textFormField(
                    text: '',
                    ifEmpty: '',
                    textInputType: TextInputType.text,
                    textEditingController: TextEditingController(),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              mainWidgetInThisPage(
                context: context,
                image: 'assets/images/image_test1.png',
                title: 'PCR Test'
              ),
              mainWidgetInThisPage(
                  context: context,
                  image: 'assets/images/image_test2.webp',
                  title: 'Protein In Urine Test '
              ),
              mainWidgetInThisPage(
                  context: context,
                  image: 'assets/images/image_test3.jpg',
                  title: 'X-Rays'
              ),
              mainWidgetInThisPage(
                  context: context,
                  image: 'assets/images/image_test4.jpg',
                  title: 'MRI'
              ),
              mainWidgetInThisPage(
                  context: context,
                  image: 'assets/images/image_test5.jpg',
                  title: 'blood analysis'
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
  required String image,
  required String title,
}
     )=>Padding(
   padding: const EdgeInsets.all(20.0),
   child: InkWell(
     onTap: (){
       // UserProfileCubit.get(context).changeShowInChatPage2(
       //   model: "mM9UopgU2dWHvcKVLNrlPB4ujj93",
       //   showInChatPage: true,
       // );

       cachHelper.saveData(key: 'doctor6', value: 5);

       HomeCubit.get(context).changeBottomNavBar(3);
       Navigator.pushAndRemoveUntil(context,
           MaterialPageRoute(builder: (context) => Layout()), (route) => false);

       print('clicked');
     },
     child: Container(
       padding: EdgeInsets.all(4),
       width: double.infinity,
       height: MediaQuery.of(context).size.height*0.12,
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

       child: Row(

         children: [
           Container(
             width: MediaQuery.of(context).size.width*0.22,
             height: MediaQuery.of(context).size.height*0.12,

             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15),
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image: AssetImage(image??'',

                   ),
                 )
             ),
           ),
           SizedBox(
             width: 13.w,
           ),
           Expanded(
             child: Text(title??'',
               style: TextStyle(
                   color: Colors.grey,
                   fontSize: 16.sp,
                   fontWeight: FontWeight.w600
               ),
             ),
           ),

         ],
       ),
     ),
   ),
 );