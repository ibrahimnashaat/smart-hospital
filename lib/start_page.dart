import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/cach_helper/cach_helper.dart';
import 'package:smart_hospital/colors.dart';

import 'login/login.dart';

class StartPage extends StatelessWidget{
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(

     backgroundColor: mainColor,


     body: Column(
       children: [
         Row(
           children: [
             Image.asset('assets/images/design1.png',
             width: MediaQuery.of(context).size.width*0.3,
             height: MediaQuery.of(context).size.height*0.22,
               color: Colors.white54,
             ),
             Spacer(),
             Image.asset('assets/images/design2.png',
             width: MediaQuery.of(context).size.width*0.4,
             height: MediaQuery.of(context).size.height*0.2,
               color: Colors.white.withOpacity(0.8),
             ),
           ],
         ),
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,

           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Container(
                   width: MediaQuery.of(context).size.width*0.4,
                   height: MediaQuery.of(context).size.height*0.15,

                   decoration: BoxDecoration(
                     color: Colors.white,

                   ),

                   child:  Column(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset('assets/images/logo.png',
                         width: MediaQuery.of(context).size.width*0.4,
                         height: MediaQuery.of(context).size.height*0.1,
                         alignment: AlignmentDirectional.center,
                       ),
                       SizedBox(
                         height: 0.5.h,
                       ),
                       Text('S M A R T  H O S P I T A L',
                       style: TextStyle(
                         fontSize: 6.sp,
                         color: mainColor,
                         fontWeight: FontWeight.w500
                       ),
                       ),
                     ],
                   ),

                 ),

                 Container(

                   width: MediaQuery.of(context).size.width*0.6,
                   height: MediaQuery.of(context).size.height*0.35,

                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(30),

                       bottomLeft: Radius.circular(30),

                     ),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.5),
                         spreadRadius: 6,
                         blurRadius: 7,
                         offset: Offset(0, 3), // changes position of shadow
                       ),
                     ],

                   ),

                   child: Stack(
                     alignment: AlignmentDirectional.centerStart,
                      children: [
                        Stack(

                          alignment: AlignmentDirectional.topEnd,
                          children: [


                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              height: MediaQuery.of(context).size.height*0.2,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(

                                    bottomLeft: Radius.circular(200),
                                    topLeft: Radius.circular(200),

                                  ),
                                  color: mainColor
                              ),
                            ),


                            Image.asset('assets/images/start_page_doctor_image.png',
                              width: MediaQuery.of(context).size.width*0.6,
                              height: MediaQuery.of(context).size.height*0.35,
                              alignment: AlignmentDirectional.bottomEnd,

                            ),


                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Consult to your',
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: mainColor,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                            Text('Online',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: mainColor,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                            Text('Doctor',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: mainColor,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                          ],
                        ),
                      ],
                   ),



                 ),


               ],
             ),

         SizedBox(
           height: 8.h,
         ),

         Container(

           width: MediaQuery.of(context).size.width*0.8,
           height: MediaQuery.of(context).size.height*0.28,

           decoration: BoxDecoration(
             color: Colors.white.withOpacity(0.4),
             borderRadius: BorderRadius.only(
               topLeft: Radius.circular(20),
               topRight: Radius.circular(20),

               bottomLeft: Radius.circular(20),
               bottomRight: Radius.circular(20),

             ),
             boxShadow: [
               BoxShadow(
                 color: Colors.black.withOpacity(0.2),
                 spreadRadius: 2,
                 blurRadius: 4,
                 offset: Offset(0, 3), // changes position of shadow
               ),
             ],

           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Container(
                 width: MediaQuery.of(context).size.width*0.18,
                 height:MediaQuery.of(context).size.height*0.01,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(
                     Radius.circular(10),
                   ),
                   color: Colors.white.withOpacity(0.7),
                 ),
               ),
               Text('Find a new doctor to cure your illness',
               style: TextStyle(
                 fontSize: 11.sp,
                 color: Colors.white,
                 fontWeight: FontWeight.w600,
               ),
               ),
               ElevatedButton(
                   onPressed: (){
                     cachHelper.saveData(key: 'startPage', value: true).then((value) {
                       if (value) {
                         Navigator.pushAndRemoveUntil(context,
                             MaterialPageRoute(builder: (context) => Login()), (route) => false);
                       }
                     });
                   },
                   child: Text('Get Started',
                     style: TextStyle(
                       color: mainColor,
                       fontWeight: FontWeight.w600
                     ),
                   ),
               ),
             ],
           ),
         ),
           ],
         ),
       ],
     ),

   );
  }


}

