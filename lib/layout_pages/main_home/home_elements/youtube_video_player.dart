import 'package:flutter/material.dart';
import 'package:smart_hospital/shared/colors.dart';
import 'package:smart_hospital/layout_pages/layout.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../home.dart';

class MyYoutubePlayer extends StatefulWidget {
  final String url;

  MyYoutubePlayer({required this.url});

  @override
  _MyYoutubePlayerState createState() => _MyYoutubePlayerState(url: url);
}

class _MyYoutubePlayerState extends State<MyYoutubePlayer> {
  final String url;
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  _MyYoutubePlayerState({required this.url});

  @override
  void initState() {
    super.initState();
    final videoId2 = YoutubePlayer.convertUrlToId(url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId2!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: true,
        showLiveFullscreenButton: false,

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
          leading: IconButton(
              onPressed: (){
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => Layout()), (route) => false);
          },
            icon:Icon(
              Icons.arrow_back_ios_rounded,
              color: secondaryColor,
            ) ,
          ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 5.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
        ),
      ),

    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
