import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hospital/layout_pages/chat_text_message/message/video_call/video_call.dart';
import 'package:smart_hospital/layout_pages/chat_text_message/message/voice_call/voice_call.dart';
import 'package:smart_hospital/shared/cach_helper/cach_helper.dart';

import 'package:zego_zimkit/zego_zimkit.dart';



import 'package:connectivity/connectivity.dart';

import '../../../shared/colors.dart';
import '../../../shared/shared.dart';
import '../../main_home/home_elements/user_profile/user_profile_cubit.dart';
import '../../main_home/home_elements/user_profile/user_profile_states.dart';




class NetworkUtils {
  static Future<bool> isNetworkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}

class Message extends StatefulWidget{






  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
   String? uid;
   String? userId;
   String? userName;

   bool? isConnected  ;
   int? doctor1;
   int? doctor2;
   int? doctor3;
   int? doctor4;
   int? doctor5;
   int? doctor6;





  @override
   initState()   {
    // TODO: implement initState
    super.initState();

    doctor1 = cachHelper.getData(key: 'doctor1');
    doctor2 = cachHelper.getData(key: 'doctor2');
    doctor3 = cachHelper.getData(key: 'doctor3');
    doctor4 = cachHelper.getData(key: 'doctor4');
    doctor5 = cachHelper.getData(key: 'doctor5');
    doctor6 = cachHelper.getData(key: 'doctor6');

    NetworkUtils.isNetworkConnected().then((value) {
      setState(() {
        // Update the state with the result
        isConnected = value;
      });
    });


    uid = FirebaseAuth.instance.currentUser?.uid;
    if(uid == "TT12nbU3WZV9nSUPBwUDXH8mmXJ2"){
      ZIMKit().connectUser(
          id: '1222',
          name:'Dr.Asmaa Reda',
          avatarUrl: 'https://firebasestorage.googleapis.com/v0/b/smart-hospital-7a180.appspot.com/o/doctors%2Fdoctor3.jpg?alt=media&token=89c62b98-7f54-4cda-950c-ead6da5b8f10'
      );

      userId = '1222';
      userName = 'Dr.Asmaa Reda';
    }else if(uid == "7v0UNsO4rrSfrf0POzqm1YF7Mo83"){
      ZIMKit().connectUser(
          id: '1221',
          name:'Dr.Nada Mostafa',
          avatarUrl: 'https://firebasestorage.googleapis.com/v0/b/smart-hospital-7a180.appspot.com/o/doctors%2Fdoctor2.jpg?alt=media&token=aa77dfb0-0ccf-4cd6-9b81-4f6ede74bdf1'
      );

      userId = '1221';
      userName = 'Dr.Nada Mostafa';

    }else if (uid == "m5EbPhM4IAOcFN9GdiMwwLABU7q2" ){
      ZIMKit().connectUser(
          id: '1223',
          name:'Dr.Ali Ahmed',
          avatarUrl: 'https://firebasestorage.googleapis.com/v0/b/smart-hospital-7a180.appspot.com/o/doctors%2Fdoctor1.jpg?alt=media&token=fb605a7c-2847-4b28-9cf5-d8fbf100fb5e'
      );
      userId = '1223';
      userName ='Dr.Ali Ahmed';
    }else if (uid == "zXree2DBHZV0Nd6cnUWhyyG3UHu2" ){
      ZIMKit().connectUser(
          id: '1224',
          name:'Dr.Jana Saeed',
          avatarUrl: 'https://firebasestorage.googleapis.com/v0/b/smart-hospital-7a180.appspot.com/o/doctors%2Fdoctor4.jfif?alt=media&token=4d051931-13fc-46d3-9bd4-b9c523e5e64c'
      );
      userId = '1224';
      userName ='Dr.Jana Saeed';
    }else if (uid == "oVhPBjNuSCWBGnlOGjfXc04lPHx2" ){
      ZIMKit().connectUser(
          id: '1225',
          name:'Dr.Sama Ibrahim',
          avatarUrl: 'https://firebasestorage.googleapis.com/v0/b/smart-hospital-7a180.appspot.com/o/doctors%2Fdoctor5.jpg?alt=media&token=6a3884e1-056d-4e5a-8083-55198753dd85'
      );
      userId = '1225';
      userName ='Dr.Sama Ibrahim';
    }else if (uid == "mM9UopgU2dWHvcKVLNrlPB4ujj93" ){
      ZIMKit().connectUser(
          id: '1226',
          name:'Dr.Mohamed Ali',
          avatarUrl: 'https://firebasestorage.googleapis.com/v0/b/smart-hospital-7a180.appspot.com/o/doctors%2Fdoctor6.jfif?alt=media&token=1e1c53ab-02c4-4c2f-bb82-3f4352549cf7'
      );
      userId = '1226';
      userName ='Dr.Mohamed Ali';
    }else{
      ZIMKit().connectUser(
          id: UserProfileCubit.get(context).userModel?.email??'',
          name:UserProfileCubit.get(context).userModel?.name??'',
          avatarUrl: UserProfileCubit.get(context).userModel?.image??'',
      );
      userId = UserProfileCubit.get(context).userModel?.email??'';
      userName =UserProfileCubit.get(context).userModel?.name??'';
    }


  }


   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
   GlobalKey<RefreshIndicatorState>();

   // Function to simulate data loading
   Future<void> _reloadData() async {
     // Add your data loading logic here
     await Future.delayed(Duration(seconds: 2));
     print('Data reloaded!');
   }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit,UserProfileStates>(
      listener: (context,state){},
      builder: (context,state){
        var model = UserProfileCubit.get(context).doctors;

        Widget yourConnectedWidget() {
          // Build your widget tree for the connected state
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if(

                      uid != "TT12nbU3WZV9nSUPBwUDXH8mmXJ2" &&
                         uid != "7v0UNsO4rrSfrf0POzqm1YF7Mo83" &&
                          uid != "m5EbPhM4IAOcFN9GdiMwwLABU7q2" &&
                         uid != "zXree2DBHZV0Nd6cnUWhyyG3UHu2" &&
                         uid != "oVhPBjNuSCWBGnlOGjfXc04lPHx2" &&
                          uid != "mM9UopgU2dWHvcKVLNrlPB4ujj93"
                      )
                      Text('Active Now',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                  if(

                      FirebaseAuth.instance.currentUser?.uid != "TT12nbU3WZV9nSUPBwUDXH8mmXJ2" &&
                      uid != "7v0UNsO4rrSfrf0POzqm1YF7Mo83" &&
                      uid != "m5EbPhM4IAOcFN9GdiMwwLABU7q2" &&
                      uid != "zXree2DBHZV0Nd6cnUWhyyG3UHu2" &&
                      uid != "oVhPBjNuSCWBGnlOGjfXc04lPHx2" &&
                      uid != "mM9UopgU2dWHvcKVLNrlPB4ujj93"
                  )
                  SizedBox(
                    height: 2.h,
                  ),
                  if(

                      uid != "TT12nbU3WZV9nSUPBwUDXH8mmXJ2" &&
                      uid != "7v0UNsO4rrSfrf0POzqm1YF7Mo83" &&
                      uid != "m5EbPhM4IAOcFN9GdiMwwLABU7q2" &&
                      uid != "zXree2DBHZV0Nd6cnUWhyyG3UHu2" &&
                      uid != "oVhPBjNuSCWBGnlOGjfXc04lPHx2" &&
                      uid != "mM9UopgU2dWHvcKVLNrlPB4ujj93"
                  )
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.13,
                    child: ListView.builder(
                      itemBuilder:(context, index)=>Row(
                        children: [
                          if(
                              index == doctor1 ||
                              index == doctor2 ||
                              index == doctor3 ||
                              index == doctor4 ||
                              index == doctor5 ||
                              index == doctor6&&
                              uid != "TT12nbU3WZV9nSUPBwUDXH8mmXJ2" &&
                              uid != "7v0UNsO4rrSfrf0POzqm1YF7Mo83" &&
                              uid != "m5EbPhM4IAOcFN9GdiMwwLABU7q2" &&
                              uid != "zXree2DBHZV0Nd6cnUWhyyG3UHu2" &&
                              uid != "oVhPBjNuSCWBGnlOGjfXc04lPHx2" &&
                              uid != "mM9UopgU2dWHvcKVLNrlPB4ujj93"
                          )
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.2,
                              height: MediaQuery.of(context).size.height*0.13,
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(model[index].image??''),
                                      ),
                                      CircleAvatar(
                                        radius: 9,
                                        backgroundColor: Colors.white,
                                      ),
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Colors.lightGreen,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.2.h,
                                  ),
                                  Expanded(
                                    child: Text(model[index].id??'',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                        ],
                      ),

                      itemCount: model.length,
                      scrollDirection: Axis.horizontal,

                    ),
                  ),
                  if(

                      uid != "TT12nbU3WZV9nSUPBwUDXH8mmXJ2" &&
                      uid != "7v0UNsO4rrSfrf0POzqm1YF7Mo83" &&
                      uid != "m5EbPhM4IAOcFN9GdiMwwLABU7q2" &&
                      uid != "zXree2DBHZV0Nd6cnUWhyyG3UHu2" &&
                      uid != "oVhPBjNuSCWBGnlOGjfXc04lPHx2" &&
                      uid != "mM9UopgU2dWHvcKVLNrlPB4ujj93"
                  )
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text('Messages',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: mainColor,
                        ),
                        child: IconButton(onPressed:()  {
                          ZIMKit().showDefaultNewPeerChatDialog(context);
                        }, icon: Icon(
                          Icons.add,
                          color:secondaryColor,
                        )),
                      ),
                    ],
                  ),



                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.4,

                    child:ZIMKitConversationListView(
                      onPressed: (context,
                          conversation,
                          defaultAction) {
                        try {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ZIMKitMessageListPage(
                                conversationID: conversation.id,
                                conversationType: conversation.type,

                                appBarActions: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VideoCall(
                                            callID: 'user1&2',
                                            userId: userId ?? '123',
                                            userName: userName ?? '123',
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.video_call),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VoiceCall(
                                            callID: 'user1&2',
                                            userId: userId ?? '123',
                                            userName: userName ?? '123',
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.call),
                                  ),
                                ],
                              );
                            },
                          ));
                        } catch (e) {

                          print('Error: $e');
                        }
                      },
                    ),



                  ),





                ],
              ),
            ),
          );
        }

        Widget yourNotConnectedWidget() {
          // Build your widget tree for the not connected state
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('Check The Network Connectivity!',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.34,

                  child: ElevatedButton(
                    onPressed: (){

                      setState(() {
                        _refreshIndicatorKey.currentState?.show();
                      });
                      // HomeCubit.get(context).changeBottomNavBar(3);

                    },
                    child: Row(
                      children: [
                        Icon(Icons.refresh),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text('Reload',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),



                  ),
                ),
              ],
            ),
          );
        }




        return SafeArea(
          child: Scaffold(
            backgroundColor: secondaryColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Message',
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

                child: RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: _reloadData,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: 'Search a Doctor',
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
                      FutureBuilder<bool>(
                        future: NetworkUtils.isNetworkConnected(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            // If the Future is still running, show a loading indicator
                            return CircularProgressIndicator();
                          } else  {
                            // If the Future is complete, check the result
                            isConnected = snapshot.data;

                            if (isConnected == true) {
                              // If connected, return your connected widget tree
                              return yourConnectedWidget();
                            } else {
                              // If not connected, return your not connected widget tree
                              return yourNotConnectedWidget();
                            }
                          }
                        },
                      ),






                    ],
                  ),
                ),
              ),
            ),

          ),
        );
      },
    );

  }

}








