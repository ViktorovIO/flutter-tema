import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:tema/main.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../const.dart';
import 'dart:ui' as ui;

class Trailer extends StatefulWidget {
  final String tagName;
  final String trailerPath;
  final String name;
  final String decription;
  final String title;
  const Trailer({
    super.key,
    required this.tagName,
    required this.trailerPath,
    required this.name,
    required this.decription,
    required this.title,
  });

  @override
  State<Trailer> createState() => _TrailerState();
}

class _TrailerState extends State<Trailer> {
  late VideoPlayerController _videoPlayerController;

  void _playVideo() {
    _videoPlayerController = VideoPlayerController.asset(widget.trailerPath)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) {});
  }

  @override
  void initState() {
    super.initState();

    _playVideo();
    //_videoPlayerController.pause();
  }

  @override
  void dispose() {
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //_videoPlayerController.pause();

    return Stack(
      children: [
        //*video
        _videoPlayerController.value.isInitialized
            ? VisibilityDetector(
                key: const Key("unique key"),
                onVisibilityChanged: (VisibilityInfo info) {
                  var visiblePercentage = info.visibleFraction * 100;
                  if (visiblePercentage != 0) {
                    _videoPlayerController.play();
                  } else {
                    _videoPlayerController.pause();
                  }
                  // debugPrint(
                  //     'Widget ${info.key} is ${visiblePercentage}% visible');
                },
                child: Center(
                  child: SizedBox.expand(
                    //height: screenHeight,
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                            width: _videoPlayerController.value.size.width,
                            height: _videoPlayerController.value.size.height,
                            child: VideoPlayer(_videoPlayerController))),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),

        //*BG shadow
        Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                const Color(0xff260E44).withOpacity(0.7),
                Colors.transparent,
              ],
            ),
          ),
        ),

        //*title and description
        Positioned(
          bottom: 90,
          left: 16,
          child: Container(
            width: screenWidth - 16 - 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //*name
                ClipRRect(
                  borderRadius: kBorderRadiusCircularDefault,
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kBorderColor,
                        ),
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: kBorderRadiusCircularDefault,
                        //border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/icons/User.svg'),
                          const SizedBox(width: 8.0),
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22.0),
                //*title
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  widget.decription,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),

        //*section name
        //TODO wrong layout
        Positioned(
          top: 48.0,
          right: 50.0,
          child: ClipRRect(
            borderRadius: kBorderRadiusCircularDefault,
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kBorderColor,
                  ),
                  borderRadius: kBorderRadiusCircularDefault,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 50, 17, 198).withOpacity(0.2),
                      Color(0xffFF00C7).withOpacity(0.2),
                      //kPageSecondColor.withOpacity(0.5),
                    ],
                  ),
                ),
                child: Text(
                  widget.tagName,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),

        //*buttons
        Positioned(
          right: 0,
          bottom: screenHeight / 3,
          //child: SvgPicture.asset('assets/icons/trailers_buttons.svg'),
          // child: ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: BackdropFilter(
          //     filter: ui.ImageFilter.blur(
          //       sigmaX: 3.0,
          //       sigmaY: 3.0,
          //     ),
          //     child: Container(
          //       width: 56,
          //       height: 56,
          //       decoration: BoxDecoration(
          //         border: Border.all(
          //           color: kBorderColor,
          //           width: 2,
          //         ),
          //         color: const Color(0xff848484).withOpacity(0.1),
          //         shape: BoxShape.circle,
          //       ),
          //       child: Icon(Icons.cabin),
          //     ),
          //   ),
          // ),

          // child: Column(
          //   children: [
          //     SvgPicture.asset('assets/icons/trailers_like_button.svg'),
          //     SvgPicture.asset('assets/icons/trailers_star_button.svg'),
          //     SvgPicture.asset('assets/icons/trailers_send_button.svg'),
          //   ],
          // ),

          child: Image.asset(
            'assets/icons/buttons.png',
            color: Colors.white.withOpacity(0.8),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
      ],
    );
  }
}
