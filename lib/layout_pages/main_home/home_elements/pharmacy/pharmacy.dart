import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/shared/cach_helper/cach_helper.dart';

import 'package:smart_hospital/shared/colors.dart';

import '../../../../shared/shared.dart';
import '../../../layout.dart';
import '../../home_cubit.dart';


class Pharmacy extends StatelessWidget{
  const Pharmacy({super.key});

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
          'Pharmacy',
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
                    text: 'Search a medicine',
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


                   Padding(
                     padding: const EdgeInsets.only(
                       top: 20,
                       bottom: 20,
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         mainWidgetInThisPage(context: context,
                             image: 'assets/images/pharmacy1.jpg', name: 'Antibiotics'),
                         mainWidgetInThisPage(context: context,
                             image: 'assets/images/pharmacy2.jpg', name: 'Anti depressants'),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(
                       top: 20,
                       bottom: 20,
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         mainWidgetInThisPage(context: context, image: 'assets/images/pharmacy3.jpg', name: 'Anti Allergies'),
                         mainWidgetInThisPage(context: context, image: 'assets/images/pharmacy4.jpg', name: 'Painkillers'),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(
                       top: 20,
                       bottom: 20,
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         mainWidgetInThisPage(context: context, image: 'assets/images/pharmacy5.webp', name: 'Antivirals'),
                         mainWidgetInThisPage(context: context, image: 'assets/images/pharmacy6.webp', name: 'Medic kit/tools'),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(
                       top: 20,
                       bottom: 20,
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         mainWidgetInThisPage(context: context, image: 'assets/images/pharmacy7.jpg', name: 'Drops'),
                         mainWidgetInThisPage(context: context, image: 'assets/images/pharmacy8.jpg', name: 'Spray'),
                       ],
                     ),
                   ),



            ],
          ),
        ),
      ),

    );
  }

}


Widget mainWidgetInThisPage(
{
  required BuildContext context,
  required String image,
  required String name,
}
    )=>InkWell(
  onTap: (){

    cachHelper.saveData(key: 'doctor5', value: 4);

    HomeCubit.get(context).changeBottomNavBar(3);
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Layout()), (route) => false);

    print('clicked');
  },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
      Container(
        width: MediaQuery.of(context).size.width*0.3,
        height: MediaQuery.of(context).size.width*0.3,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width*0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.9),
        ),
        child: Center(child: Text(name,
          style: TextStyle(
              color: HexColor('333333').withOpacity(0.8),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500
          ),
        ),),
      ),
        ],
      ),
    );