import 'package:flutter/material.dart';
import 'package:tema/screens/main_page.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _videoPlayerController;
  late Timer _timer;
  //int _start = 1;

  void _playVideo() {
    _videoPlayerController = VideoPlayerController.asset(
        'assets/splash/1-1.mp4')
      ..addListener(() {
        setState(() {
          if (_videoPlayerController.value.position ==
              _videoPlayerController.value.duration) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const MainPage())));
          }
        });
      })
      ..setLooping(false)
      ..initialize().then((value) {
        _videoPlayerController.setVolume(0.0);
        _videoPlayerController.play();
      });
  }

  @override
  void initState() {
    super.initState();
    _playVideo();
    //print(_videoPlayerController.value.duration);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
            width: 200,
            height: 112,
            child: VideoPlayer(_videoPlayerController)),
      ),
    );
  }
}
