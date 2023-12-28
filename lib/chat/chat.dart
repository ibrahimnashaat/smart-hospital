// import 'package:flutter/material.dart';
// import 'package:zego_zimkit/zego_zimkit.dart';
//
//
// ZIMKit().connectUser(id: id, name: name).then(_){
// Navigator.of(context).push(
// MaterialPageRoute(
// builder: (context) => const ZIMKitDemoHomePage(),
// ),
// );
// }
//
// class ZIMKitDemoHomePage extends StatelessWidget {
// const ZIMKitDemoHomePage({Key? key}) : super(key: key);
//
// @override
// Widget build(BuildContext context) {
//
// return WillPopScope(
// onWillPop: () async => false,
// child: Scaffold(
// appBar: AppBar(
// title: const Text('Conversations'),
// actions: const [HomePagePopupMenuButton()],
// ),
// body: ZIMKitConversationListView(
// onPressed: (context, conversation, defaultAction) {
// Navigator.push(context, MaterialPageRoute(
// builder: (context) {
// return ZIMKitMessageListPage(
// conversationID: conversation.id,
// conversationType: conversation.type,
// );
// },
// ));
// },
// ),
// ),
// );
// }
// }